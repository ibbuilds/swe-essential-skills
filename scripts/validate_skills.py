"""Check suite identities, UI metadata and local references, not model behavior."""
from pathlib import Path
import re
import sys
from urllib.parse import unquote, urlsplit

import yaml


SKILL_PREFIX = "swe-essential-skills-"


class UniqueStringKeyLoader(yaml.SafeLoader):
    """Reject explicit duplicate string keys, without rejecting merge overrides."""

    def __init__(self, stream):
        super().__init__(stream)
        self._checked_mappings = set()

    def flatten_mapping(self, node):
        # PyYAML mutates nodes while expanding merges. Check each original node
        # once, including shared aliases, before inherited keys are inserted.
        if node not in self._checked_mappings:
            self._checked_mappings.add(node)
            seen = set()
            for key, _ in node.value:
                if key.tag == "tag:yaml.org,2002:str":
                    if key.value in seen:
                        raise yaml.constructor.ConstructorError(
                            "while constructing a mapping", node.start_mark,
                            f"duplicate explicit key {key.value!r}", key.start_mark)
                    seen.add(key.value)
        return super().flatten_mapping(node)


def load_yaml(raw):
    """Keep parser exhaustion in the ordinary metadata-validation error path."""
    try:
        return yaml.load(raw, Loader=UniqueStringKeyLoader)
    except RecursionError as exc:
        raise ValueError(f"YAML nesting exceeds parser capacity: {exc}") from exc


def validate(root: Path) -> list[str]:
    errors = []
    skills = sorted((root / "skills").glob("*/SKILL.md"))
    if not skills:
        return ["No skills found"]
    names = set()
    for entry in skills:
        folder = entry.parent.resolve()
        try:
            content = entry.read_text(encoding="utf-8")
            # Match the inspected Codex delimiter lines, not inline tokens.
            lines = content.splitlines(keepends=True)
            if not lines or lines[0].strip() != "---":
                raise ValueError("missing YAML frontmatter")
            closing = next((i for i in range(1, len(lines)) if lines[i].strip() == "---"), None)
            if closing is None:
                raise ValueError("missing YAML frontmatter")
            metadata = load_yaml("".join(lines[1:closing]))
            if not isinstance(metadata, dict):
                raise ValueError("frontmatter must be a mapping")
            name = metadata.get("name")
            if not isinstance(name, str) or not re.fullmatch(r"[a-z0-9]+(?:-[a-z0-9]+)*", name) or len(name) > 64:
                raise ValueError("invalid skill name")
            if not name.startswith(SKILL_PREFIX) or name == SKILL_PREFIX:
                raise ValueError(f"skill name must use repository prefix {SKILL_PREFIX}")
            if name != entry.parent.name or name in names:
                raise ValueError("name must match folder and be unique")
            names.add(name)
            description = metadata.get("description")
            if not isinstance(description, str) or not description.strip() or len(description) > 1024:
                raise ValueError("description must be nonempty text under 1,025 characters")
            # Portable Agent Skills format, not an emulation of host coercions.
            if "metadata" in metadata:
                extra = metadata["metadata"]
                if not isinstance(extra, dict) or any(
                    not isinstance(key, str) or not isinstance(value, str)
                    for key, value in extra.items()
                ):
                    raise ValueError("metadata must map string keys to string values; "
                                     "quote scalar values, or omit unused metadata/use {}")
            if not "".join(lines[closing + 1:]).strip():
                raise ValueError("missing skill instructions")
            ui = load_yaml((entry.parent / "agents" / "openai.yaml").read_text(encoding="utf-8"))
            interface = ui.get("interface") if isinstance(ui, dict) else None
            if not isinstance(interface, dict):
                raise ValueError("missing presentation interface")
            expected_display = name
            if interface.get("display_name") != expected_display:
                raise ValueError("display name must match the canonical repository-prefixed skill name")
            short = interface.get("short_description")
            if not isinstance(short, str) or not 25 <= len(short) <= 64:
                raise ValueError("short description must contain 25–64 characters")
        except (ValueError, OSError, yaml.YAMLError) as exc:
            errors.append(f"{entry.relative_to(root)}: {exc}")
            continue
        for document in entry.parent.rglob("*.md"):
            if document.is_symlink():
                errors.append(f"{document.relative_to(root)}: symlink not portable")
                continue
            label = document.relative_to(root)
            try:
                text = document.read_text(encoding="utf-8")
            except (OSError, UnicodeError) as exc:
                errors.append(f"{label}: cannot read Markdown: {exc}")
                continue
            # Markdown inline links only. External links and anchors are not fetched.
            for link in re.findall(r"\[[^\]]*\]\(([^\s)]+)\)", text):
                try:
                    parsed = urlsplit(link)
                    if parsed.scheme or parsed.netloc or not parsed.path:
                        continue
                    target = (document.parent / unquote(parsed.path)).resolve()
                    if not target.is_relative_to(folder):
                        errors.append(f"{label}: reference leaves skill: {link}")
                    elif not target.is_file():
                        errors.append(f"{label}: missing reference: {link}")
                except (ValueError, OSError, RuntimeError) as exc:
                    errors.append(f"{label}: invalid or unreadable reference {link}: {exc}")
    return errors


if __name__ == "__main__":
    root = Path(__file__).resolve().parents[1]
    failures = validate(root)
    print("\n".join(failures) if failures else "Skill metadata and inline local references passed; behavior not evaluated.")
    sys.exit(bool(failures))
