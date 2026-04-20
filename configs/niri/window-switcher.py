#!/usr/bin/env python3

import json
import re
import subprocess
import sys
from dataclasses import dataclass
from pathlib import Path


APP_DIRS = [
    Path.home() / ".local/share/applications",
    Path("/var/lib/flatpak/exports/share/applications"),
    Path.home() / ".local/share/flatpak/exports/share/applications",
    Path("/usr/local/share/applications"),
    Path("/usr/share/applications"),
]


@dataclass(frozen=True)
class DesktopEntry:
    desktop_id: str
    stem: str
    name: str | None
    icon: str | None


def run(*args: str, input_text: str | None = None) -> subprocess.CompletedProcess[str]:
    return subprocess.run(
        args,
        input=input_text,
        text=True,
        capture_output=True,
        check=False,
    )


def sanitize(value: str | None, fallback: str = "") -> str:
    value = value or fallback
    return re.sub(r"[\t\n\r]+", " ", value).strip()


def normalized(value: str) -> str:
    return re.sub(r"[^a-z0-9]", "", value.lower())


def tokens(value: str) -> list[str]:
    return [part for part in re.split(r"[^a-z0-9]+", value.lower()) if part]


def parse_desktop_entry(path: Path) -> DesktopEntry | None:
    desktop_id = path.name
    stem = desktop_id.removesuffix(".desktop")
    in_entry = False
    name = None
    icon = None

    try:
        with path.open(encoding="utf-8", errors="replace") as f:
            for raw_line in f:
                line = raw_line.strip()
                if not line or line.startswith("#"):
                    continue
                if line.startswith("[") and line.endswith("]"):
                    if line == "[Desktop Entry]":
                        in_entry = True
                        continue
                    if in_entry:
                        break
                    continue
                if not in_entry or "=" not in line:
                    continue
                key, value = line.split("=", 1)
                if key == "Name" and not name:
                    name = value
                elif key == "Icon" and not icon:
                    icon = value
    except OSError:
        return None

    return DesktopEntry(desktop_id=desktop_id, stem=stem, name=name, icon=icon)


def load_desktop_entries() -> list[DesktopEntry]:
    seen: set[str] = set()
    entries: list[DesktopEntry] = []

    for app_dir in APP_DIRS:
        if not app_dir.is_dir():
            continue
        for path in app_dir.glob("*.desktop"):
            if path.name in seen:
                continue
            entry = parse_desktop_entry(path)
            if entry is None:
                continue
            seen.add(path.name)
            entries.append(entry)

    return entries


def score_entry(app_id: str, entry: DesktopEntry) -> int:
    app_id_norm = normalized(app_id)
    stem_norm = normalized(entry.stem)
    desktop_id_norm = normalized(entry.desktop_id)
    app_tokens = tokens(app_id)
    stem_tokens = tokens(entry.stem)
    name_tokens = tokens(entry.name or "")

    score = 0
    if entry.desktop_id == f"{app_id}.desktop":
        score += 200
    if entry.stem == app_id:
        score += 180
    if stem_norm == app_id_norm:
        score += 160
    if desktop_id_norm == f"{app_id_norm}desktop":
        score += 140
    if app_id_norm and app_id_norm in stem_norm:
        score += 100
    if app_id_norm and stem_norm.endswith(app_id_norm):
        score += 90

    if app_tokens:
        if all(token in stem_tokens for token in app_tokens):
            score += 120
        elif all(token in name_tokens for token in app_tokens):
            score += 80
        elif all(token in stem_norm for token in app_tokens):
            score += 60

    return score


def resolve_desktop_entry(
    app_id: str, entries: list[DesktopEntry]
) -> DesktopEntry | None:
    best = max(entries, key=lambda entry: score_entry(app_id, entry), default=None)
    if best is None or score_entry(app_id, best) <= 0:
        return None
    return best


def focus_key(window: dict) -> tuple[int, int, int]:
    ts = window.get("focus_timestamp") or {}
    return (
        1 if window.get("is_focused") else 0,
        int(ts.get("secs", 0)),
        int(ts.get("nanos", 0)),
    )


def build_rows(windows: list[dict], desktop_entries: list[DesktopEntry]) -> list[str]:
    rows: list[str] = []

    sorted_windows = sorted(windows, key=focus_key, reverse=True)
    non_focused = [window for window in sorted_windows if not window.get("is_focused")]
    focused = [window for window in sorted_windows if window.get("is_focused")]

    for window in [*non_focused, *focused]:
        app_id = sanitize(window.get("app_id"), "unknown")
        desktop_entry = resolve_desktop_entry(app_id, desktop_entries)
        app_name = sanitize(desktop_entry.name if desktop_entry else app_id, app_id)
        icon = sanitize(desktop_entry.icon if desktop_entry else app_id)
        title = sanitize(window.get("title"), app_name) or app_name
        window_id = str(window["id"])

        row = f"{app_name}\t{title}\t{window_id}"
        if icon:
            row += f"\0icon\x1f{icon}"
        rows.append(row)

    return rows


def choose_window(rows: list[str]) -> str | None:
    if not rows:
        return None

    result = run(
        "fuzzel",
        "--dmenu",
        "--auto-select",
        "--prompt",
        "❯ ",
        "--lines",
        "15",
        "--width",
        "80",
        "--with-nth",
        "2",
        "--match-nth",
        "{1} {2}",
        "--accept-nth",
        "3",
        "--only-match",
        input_text="\n".join(rows),
    )
    if result.returncode != 0:
        return None

    selection = result.stdout.strip()
    return selection or None


def main() -> int:
    windows_proc = run("niri", "msg", "-j", "windows")
    if windows_proc.returncode != 0:
        print(windows_proc.stderr, file=sys.stderr, end="")
        return windows_proc.returncode

    windows = json.loads(windows_proc.stdout)
    rows = build_rows(windows, load_desktop_entries())

    if len(sys.argv) > 1 and sys.argv[1] == "--print":
        print("\n".join(rows))
        return 0

    window_id = choose_window(rows)
    if not window_id:
        return 0

    focus_proc = run("niri", "msg", "action", "focus-window", "--id", window_id)
    if focus_proc.returncode != 0:
        print(focus_proc.stderr, file=sys.stderr, end="")
        return focus_proc.returncode

    return 0


if __name__ == "__main__":
    sys.exit(main())
