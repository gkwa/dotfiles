# /// script
# requires-python = ">=3.12"
# ///
"""PostToolUse hook: link each newly written vault note to today's daily note."""

import datetime
import json
import pathlib
import re
import subprocess
import sys

VAULT = pathlib.Path("/Users/mtm/Documents/Obsidian Vault")
DATED_NAME = re.compile(r"^\d{4}-\d{2}-\d{2}$")
REMINDER = "New vault note {stem}: it is now linked both ways with [[{day}]]."


def new_vault_note(payload: dict) -> pathlib.Path | None:
    if payload.get("tool_name") != "Write":
        return None
    if payload.get("tool_response", {}).get("type") != "create":
        return None
    path = pathlib.Path(payload.get("tool_input", {}).get("file_path", ""))
    if path.suffix != ".md" or path.parent != VAULT:
        return None
    if DATED_NAME.match(path.stem):
        return None
    return path


def append_text(path: pathlib.Path, text: str) -> None:
    existing = path.read_text() if path.exists() else ""
    if existing and not existing.endswith("\n"):
        existing += "\n"
    separator = "\n" if existing.strip() else ""
    path.write_text(existing + separator + text)


def link_both_ways(note: pathlib.Path, daily: pathlib.Path) -> bool:
    day_link = f"[[{daily.stem}]]"
    note_link = f"[[{note.stem}]]"
    changed = False
    if day_link not in note.read_text():
        append_text(note, f"{day_link}\n")
        changed = True
    if not daily.exists() or note_link not in daily.read_text():
        append_text(daily, f"## {note.stem}\n\n{note_link}\n")
        changed = True
    return changed


def commit(paths: list[pathlib.Path], day: str) -> None:
    names = [str(p) for p in paths]
    subprocess.run(["git", "add", "--", *names], cwd=VAULT, check=False)
    subprocess.run(
        ["git", "commit", "--quiet", "-m", f"Link new note to daily note {day}", "--", *names],
        cwd=VAULT,
        check=False,
    )


def main() -> None:
    note = new_vault_note(json.load(sys.stdin))
    if note is None:
        return
    day = datetime.date.today().isoformat()
    daily = VAULT / f"{day}.md"
    if link_both_ways(note, daily):
        commit([note, daily], day)
    context = REMINDER.format(stem=note.stem, day=day)
    output = {"hookSpecificOutput": {"hookEventName": "PostToolUse", "additionalContext": context}}
    print(json.dumps(output))


if __name__ == "__main__":
    main()
