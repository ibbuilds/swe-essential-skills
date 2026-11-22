#!/usr/bin/env python3
"""Run eval cases that need a shell, with and without this plugin, through headless `claude -p`.

`claude plugin eval` refuses to grant Bash where it has no OS sandbox (native Windows).
This script runs the same case format on your machine instead, as you, in a temporary
directory built by the case's scaffold. Only run cases you wrote.

Usage: python scripts/shell_trial.py <case-glob> [--runs N] [--arms with,without]
                                     [--model M] [--budget USD] [--judge-model M]

Differences from `claude plugin eval`, so read results with care:
- Your user CLAUDE.md loads in both arms (your real environment); plugins and MCP servers
  from your settings do not.
- Graders supported: regex, tool_used, file_exists, llm, command. LLM graders get one judge vote.
  `command` runs `run:` with bash in the workdir (CASE_DIR = the case folder); exit 0 passes.
- `focus: trace` gives the judge a condensed transcript: each tool call, and the first
  lines of each result, in order.
"""
from __future__ import annotations

import argparse
import fnmatch
import json
import os
import re
import shutil
import subprocess
import sys
import tempfile
import time
from pathlib import Path

import yaml

ROOT = Path(__file__).resolve().parent.parent
CASES = ROOT / "evals-shell"
RESULTS = CASES / "results"


def frontmatter(path: Path) -> tuple[dict, str]:
    text = path.read_text(encoding="utf-8").replace("\r\n", "\n")
    _, raw, body = text.split("---\n", 2)
    return yaml.safe_load(raw) or {}, body.strip()


def find_bash() -> str:
    bash = os.environ.get("SHELL_TRIAL_BASH") or shutil.which("bash")
    if not bash or "system32" in bash.lower():
        sys.exit("Git Bash not found; set SHELL_TRIAL_BASH to its bash.exe")
    return bash


def run_scaffold(case: Path, workdir: Path) -> None:
    script = case / "scaffold.sh"
    if not script.is_file():
        return
    subprocess.run([find_bash(), str(script)], cwd=workdir, check=True, capture_output=True)


def run_claude(prompt: str, meta: dict, workdir: Path, arm: str, args) -> list[dict]:
    tools = list(dict.fromkeys([*(meta.get("allowed_tools") or []), "Bash", "PowerShell"]))
    cmd = [
        "claude", "-p", prompt,
        "--output-format", "stream-json", "--verbose",
        "--no-session-persistence", "--setting-sources", "project", "--strict-mcp-config",
        "--max-turns", str(meta.get("max_turns", 30)),
        "--max-budget-usd", str(args.budget),
        "--allowedTools", ",".join(tools),
        "--model", args.model,
    ]
    if arm == "with":
        cmd += ["--plugin-dir", str(ROOT)]
    proc = subprocess.run(cmd, cwd=workdir, capture_output=True, text=True, encoding="utf-8",
                          timeout=meta.get("timeout_seconds", 600))
    events = []
    for line in proc.stdout.splitlines():
        try:
            events.append(json.loads(line))
        except json.JSONDecodeError:
            continue
    return events


def tool_calls(events: list[dict]):
    for event in events:
        message = event.get("message")
        if event.get("type") != "assistant" or not isinstance(message, dict):
            continue
        for block in message.get("content", []):
            if isinstance(block, dict) and block.get("type") == "tool_use":
                yield block


def trace_text(events: list[dict]) -> str:
    return "\n".join(json.dumps(e, separators=(",", ":"), ensure_ascii=False) for e in events)


def condensed(events: list[dict]) -> str:
    lines = []
    for event in events:
        message = event.get("message")
        content = message.get("content", []) if isinstance(message, dict) else []
        if not isinstance(content, list):
            continue
        for block in content:
            kind = block.get("type")
            if kind == "tool_use":
                lines.append(f"CALL {block['name']}: {json.dumps(block.get('input'), ensure_ascii=False)[:600]}")
            elif kind == "tool_result":
                body = block.get("content")
                if isinstance(body, list):
                    body = " ".join(part.get("text", "") for part in body if isinstance(part, dict))
                lines.append("RESULT: " + "\n  ".join(str(body).splitlines()[:15])[:1200])
            elif kind == "text" and event.get("type") == "assistant":
                lines.append("SAYS: " + block["text"][:800])
    return "\n".join(lines)


def last_message(events: list[dict]) -> str:
    for event in reversed(events):
        if event.get("type") == "result":
            return event.get("result") or ""
    return ""


def target_text(target, events, workdir: Path) -> str:
    if isinstance(target, dict) and target.get("source") == "file":
        path = workdir / target["path"]
        return path.read_text(encoding="utf-8", errors="replace") if path.is_file() else ""
    if target == "trace":
        return trace_text(events)
    return last_message(events)


def judge(criteria: str, evidence: str, model: str) -> bool:
    prompt = (
        "You grade an AI coding agent's run. Apply the criteria strictly to the evidence. "
        "Answer with one word on the last line: PASS or FAIL.\n\n"
        f"<criteria>\n{criteria}\n</criteria>\n\n<evidence>\n{evidence[-60000:]}\n</evidence>"
    )
    out = subprocess.run(["claude", "-p", "--model", model, "--no-session-persistence",
                          "--setting-sources", "project", "--strict-mcp-config", "--max-turns", "1"],
                         input=prompt, capture_output=True, text=True, encoding="utf-8", timeout=180)
    words = re.findall(r"\b(PASS|FAIL)\b", out.stdout)
    return bool(words) and words[-1] == "PASS"


def grade(grader: Path, events: list[dict], workdir: Path, judge_model: str) -> bool:
    fields, body = frontmatter(grader)
    kind = fields.get("type")
    if kind == "regex":
        text = target_text(fields.get("target", "last_message"), events, workdir)
        flags = re.I if "i" in str(fields.get("flags", "")) else 0
        found = re.search(fields["pattern"], text, flags | re.M) is not None
        return not found if fields.get("match") == "not_contains" else found
    if kind == "tool_used":
        pattern = re.compile(fields.get("input_match", ""))
        hits = sum(1 for call in tool_calls(events) if call["name"] == fields["tool"]
                   and pattern.search(json.dumps(call.get("input"), separators=(",", ":"))))
        return fields.get("min", 1) <= hits <= fields.get("max", 10**9)
    if kind == "file_exists":
        exists = any(workdir.glob(fields["path"]))
        return exists if fields.get("exists", True) else not exists
    if kind == "llm":
        focus = fields.get("focus", "last_message")
        evidence = condensed(events) if focus == "trace" else target_text(focus, events, workdir)
        return judge(body, evidence, judge_model)
    if kind == "command":
        env = {**os.environ, "CASE_DIR": grader.parent.parent.as_posix()}
        try:
            proc = subprocess.run([find_bash(), "-c", fields["run"]], cwd=workdir, env=env,
                                  capture_output=True, text=True, encoding="utf-8", timeout=300)
        except subprocess.TimeoutExpired:
            return False
        return proc.returncode == 0
    raise ValueError(f"{grader}: unsupported grader type {kind}")


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("case_glob")
    parser.add_argument("--runs", type=int, default=1)
    parser.add_argument("--arms", default="with,without")
    parser.add_argument("--model", default="opus")
    parser.add_argument("--judge-model", default="haiku")
    parser.add_argument("--budget", type=float, default=2.0, help="max USD per agent run")
    args = parser.parse_args()

    cases = [c for c in sorted(CASES.iterdir()) if c.is_dir() and c.name != "results"
             and fnmatch.fnmatch(c.name, args.case_glob)]
    if not cases:
        sys.exit(f"no case in {CASES} matches {args.case_glob}")
    out_dir = RESULTS / time.strftime("%Y%m%dT%H%M%S")
    out_dir.mkdir(parents=True)
    summary = []
    for case in cases:
        meta, prompt = frontmatter(case / "prompt.md")
        graders = sorted((case / "graders").glob("*.md"))
        for arm in args.arms.split(","):
            for run in range(1, args.runs + 1):
                workdir = Path(tempfile.mkdtemp(prefix="shell-trial-"))
                try:
                    run_scaffold(case, workdir)
                    events = run_claude(prompt, meta, workdir, arm, args)
                    (out_dir / f"{case.name}-{arm}-{run}.jsonl").write_text(trace_text(events), encoding="utf-8")
                    verdicts = {g.stem: grade(g, events, workdir, args.judge_model) for g in graders}
                finally:
                    shutil.rmtree(workdir, ignore_errors=True)
                cost = next((e.get("total_cost_usd") for e in events if e.get("type") == "result"), None)
                score = sum(verdicts.values()) / len(verdicts) if verdicts else 0.0
                row = {"case": case.name, "arm": arm, "run": run, "score": score, "cost": cost, "graders": verdicts}
                summary.append(row)
                print(json.dumps(row), flush=True)
    (out_dir / "summary.json").write_text(json.dumps(summary, indent=2), encoding="utf-8")
    for case in cases:
        for arm in args.arms.split(","):
            rows = [r for r in summary if r["case"] == case.name and r["arm"] == arm]
            print(f"{case.name:32} {arm:8} {sum(r['score'] for r in rows) / len(rows):.2f} (n={len(rows)})")
    return 0


if __name__ == "__main__":
    sys.exit(main())
