#!/bin/sh

# -----------------------------------------------------------------------------
# Function: run_git_diff
#
# Generates a Git diff between START_REF and END_REF in the specified REPO_PATH.
#
# Globals Used:
#   REPO_PATH, START_REF, END_REF
#
# Globals Set:
#   DIFF_OUTPUT
#
# Notes:
# - Uses 'git -C' to avoid changing the global working directory.
# - Exits on error if the diff cannot be generated.
# -----------------------------------------------------------------------------
run_git_diff() {
  if ! DIFF_OUTPUT=$(git -C "$REPO_PATH" diff "$START_REF" "$END_REF"); then
    echo "Error: Failed to generate diff from '$START_REF' to '$END_REF' in repo '$REPO_PATH'" >&2
    exit 1
  fi
}
