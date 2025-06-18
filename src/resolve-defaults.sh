#!/bin/sh

# -----------------------------------------------------------------------------
# Function: resolve_defaults
#
# Sets default values for START_REF and END_REF if not provided by user.
# END_REF defaults to "HEAD".
# START_REF defaults to the commit before END_REF.
#
# Globals Used:
#   REPO_PATH, START_REF, END_REF
#
# Globals Set:
#   START_REF, END_REF
# -----------------------------------------------------------------------------
resolve_defaults() {
  # Determine effective END_REF
  [ -z "$END_REF" ] && END_REF="HEAD"

  # Resolve START_REF as previous commit if not provided
  if [ -z "$START_REF" ]; then
    prev_commit=$(git -C "$REPO_PATH" rev-parse "$END_REF^" 2>/dev/null || true)
    if [ -z "$prev_commit" ]; then
      echo "Error: No previous commit found for '$END_REF'" >&2
      exit 1
    fi
    START_REF="$prev_commit"
  fi
}
