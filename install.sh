#!/bin/sh
# Install Diskscope for the current user (no root needed).
set -e
cd "$(dirname "$0")"
BIN="${XDG_BIN_HOME:-$HOME/.local/bin}"
APPS="${XDG_DATA_HOME:-$HOME/.local/share}/applications"

if [ "$1" = "--uninstall" ]; then
    rm -f "$BIN/diskscope" "$APPS/diskscope.desktop"
    echo "Diskscope uninstalled."
    exit 0
fi

mkdir -p "$BIN" "$APPS"
ln -sf "$PWD/diskscope" "$BIN/diskscope"
cp diskscope.desktop "$APPS/diskscope.desktop"
command -v update-desktop-database >/dev/null && update-desktop-database "$APPS" 2>/dev/null || true
echo "Installed: $BIN/diskscope (symlink) and $APPS/diskscope.desktop"
