#!/usr/bin/env bash
# Install the full Workbench 1.3 experience (Lua, hooks, fonts, icons, cursor).
# omarchy theme install clones with .git, which makes Omarchy drop hyprland.lua.
# This script copies without .git so floating windows, borders, and hooks apply.

set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
DEST="$HOME/.config/omarchy/themes/workbench-1.3"
HOOKS=(
  workbench-1.3-float
  workbench-1.3-font
  workbench-1.3-icons
  workbench-1.3-nautilus
  workbench-1.3-starship
)

if ! command -v omarchy >/dev/null; then
  echo "omarchy is not on PATH. Run this on an Omarchy system." >&2
  exit 1
fi

if [[ "$ROOT" == "$DEST" ]]; then
  echo "Theme is already in $DEST (likely from omarchy theme install)."
  echo "Removing .git so Omarchy treats it as a user theme and keeps Lua."
  rm -rf "$DEST/.git"
else
  mkdir -p "$DEST"
  rsync -a --delete \
    --exclude '.git' \
    --exclude 'install.sh' \
    --exclude '.gitignore' \
    "$ROOT/" "$DEST/"
fi

chmod 755 "$DEST"/workbench-1.3-* 2>/dev/null || true

for hook in "${HOOKS[@]}"; do
  if [[ -f $DEST/$hook ]]; then
    omarchy hook install theme-set "$DEST/$hook"
  fi
done

omarchy theme set workbench-1.3

echo
echo "Workbench 1.3 is installed and applied."
echo "Open a new terminal for Starship and Topaz. Reopen GTK apps for the stylesheet."
