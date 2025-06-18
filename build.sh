#!/bin/sh

set -eu

# cat parts/header.sh parts/helpers.sh parts/main.sh >dist/git-diff-range
# chmod +x dist/git-diff-range
# ln -sf "$HOME/engineering/tools/dist/git-diff-range" "$HOME/.local/bin/util-scripts/git-diff-range"

######################################################
################# Resolve Script Dir #################
# Supports bash/zsh/dash etc
SCRIPT_PATH="$0"
case "$SCRIPT_PATH" in
/*) SCRIPT_DIR=$(dirname "$SCRIPT_PATH") ;;
*) SCRIPT_DIR=$(cd "$(dirname "$SCRIPT_PATH")" && pwd) ;;
esac
################# Resolve Script Dir #################
######################################################

##################################################
##################### Config #####################
ROOT_DIR="$SCRIPT_DIR"
SRC_DIR="$ROOT_DIR/src"
DIST_DIR="$ROOT_DIR/dist"
OUTPUT_FILE="$DIST_DIR/git-diff-range"
BIN_DIR="$HOME/.local/bin/util-scripts"
LINK_NAME="$BIN_DIR/git-diff-range"
##################### Config #####################
##################################################

#################################################
##################### Setup #####################
mkdir -p "$DIST_DIR"
mkdir -p "$BIN_DIR"
##################### Setup #####################
#################################################

#################################################
##################### Build #####################
echo "Building $OUTPUT_FILE..."
cat "$SRC_DIR"/*.sh >"$OUTPUT_FILE"

# Set as executable
chmod +x "$OUTPUT_FILE"

# Symlink
ln -sf "$OUTPUT_FILE" "$LINK_NAME"
##################### Build #####################
#################################################

echo "Built and linked to $LINK_NAME"
