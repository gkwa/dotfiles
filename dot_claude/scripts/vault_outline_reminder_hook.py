# /// script
# requires-python = ">=3.12"
# ///
"""PostToolUse hook: remind Claude to run outline-headings on any vault note it writes or edits."""

import json
import pathlib
import re
import sys

VAULT = pathlib.Path("/Users/mtm/Documents/Obsidian Vault")
DATED_NAME = re.compile(r"^\d{4}-\d{2}-\d{2}$")
TOOLS = {"Write", "Edit"}
REMINDER = (
    "Vault note {name} was written or edited. "
    "Run the outline-headings skill on it before finishing, without asking the user, "
    "and commit that note on its own."
)


def touched_vault_note(payload: dict) -> pathlib.Path | None:
    if payload.get("tool_name") not in TOOLS:
        return None
    path = pathlib.Path(payload.get("tool_input", {}).get("file_path", ""))
    if path.suffix != ".md":
        return None
    if not path.is_relative_to(VAULT):
        return None
    relative = path.relative_to(VAULT)
    if any(part.startswith(".") for part in relative.parts):
        return None
    if DATED_NAME.match(path.stem):
        return None
    return relative


def main() -> None:
    note = touched_vault_note(json.load(sys.stdin))
    if note is None:
        return
    context = REMINDER.format(name=note)
    output = {"hookSpecificOutput": {"hookEventName": "PostToolUse", "additionalContext": context}}
    print(json.dumps(output))


if __name__ == "__main__":
    main()
