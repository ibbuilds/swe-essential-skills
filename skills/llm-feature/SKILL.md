---
name: llm-feature
description: 'Building or changing a feature that calls an LLM. Use when the user wants to add AI, a chatbot, an agent, RAG, summarization, extraction, classification or generation with a model, change a prompt or the model, or says "the AI output is bad", "improve the prompt", "which model should we use for this", "add evals", even when the prompt looks like a one-line string or the model name seems well known. Load it alongside claude-api, which covers only the SDK.'
metadata:
  type: technique
---

**An LLM feature** is code whose core logic is a prompt. It gets the same discipline as code: a versioned source file, a test set it must pass, typed output, and measured cost.

When the task is building or fixing evals or a judge, or the output quality is bad and nobody knows why, follow [EVALS.md](EVALS.md) first.

## Process

1. **Write the contract.** Input, output shape, what a good answer is, what must never happen, and the latency and cost per call the feature can afford. Done when each line is checkable.
2. **Build the eval set before the prompt.** 10–30 cases in a file next to the prompt: typical inputs, edge cases, and adversarial ones (empty, very long, wrong language, injected instructions). Each case has a pass/fail check, in code wherever possible ([EVALS.md](EVALS.md) covers judges). Done when the cases run with one command; for an existing feature, when the current prompt has a score.
3. **Pick the model from current docs.** Read the model IDs, prices, context limits and features from the provider's docs or SDK, not memory; for Claude, call the Skill tool with `claude-api`. Start with the cheapest model that might pass and move up only when the eval says so. Done when the model ID and its price per million tokens are cited from the docs.
4. **Write the prompt as a file.** Keep it under version control, for example `prompts/<feature>.md`, loaded by the code, with variables filled at runtime, rather than a string inside a handler. Give each rule one home: a rule lives in the system prompt, the tool schema or the code, never repeated in all three. Request structured output (tool use, JSON schema, or the SDK's parsed output) and validate it in code; retry or fail cleanly when it does not parse. Done when the code reads the prompt from the file and the output is typed.
5. **Wire it for production.** Timeout and bounded retries with backoff; prompt caching for any long shared prefix; one log line per call with the model, input and output tokens, cost, latency and prompt version. Done when one call's log line shows all of these.
6. **Run the eval and report.** Run on every prompt or model change. Fix tool-use failures in the tool schema rather than in prose. Done when the score, the failures, cost and latency are in the report.

<llm-feature-report>
**Model:** <id> (<$ in / $ out per MTok>, from <docs URL>)
**Prompt:** `<path>` · **Eval set:** `<path>`, <N> cases · **Run:** `<command>`
**Score:** <passed>/<N>. Failures: <case: why>
**Per call:** <tokens in/out>, <$>, <p50 / p95 latency> or not run
**Risks left:** <injection paths, untested inputs, cost at scale>
</llm-feature-report>
