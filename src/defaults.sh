#!/bin/sh

resolve_defaults() {
  cd "$REPO_PATH"

  [ -z "$END_REF" ] && END_REF="HEAD"

  if [ -z "$START_REF" ]; then
    PREV_COMMIT=$(git rev-parse "$END_REF^" 2>/dev/null || true)
    if [ -z "$PREV_COMMIT" ]; then
      echo "Error: No previous commit found for '$END_REF'" >&2
      exit 1
    fi
    START_REF="$PREV_COMMIT"
  fi
}
