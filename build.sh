#!/bin/sh

set -eu

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
SRC_DIR="$SCRIPT_DIR/src"
DIST_DIR="$SCRIPT_DIR/dist"
OUT_FILE="$DIST_DIR/git-diff-range"
BIN_LINK="$HOME/.local/bin/util-scripts/git-diff-range"

mkdir -p "$DIST_DIR"
mkdir -p "$(dirname "$BIN_LINK")"

cat "$SRC_DIR"/*.sh "$SCRIPT_DIR/main.sh" >"$OUT_FILE"

chmod +x "$OUT_FILE"
ln -sf "$OUT_FILE" "$BIN_LINK"

echo "Built and linked to $BIN_LINK"
