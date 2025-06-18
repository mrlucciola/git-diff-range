#!/bin/sh

handle_output() {
  if [ -n "$OUT_PATH" ]; then
    echo "$DIFF_OUTPUT" >"$OUT_PATH"
    [ "$VERBOSE" = "true" ] && echo "$DIFF_OUTPUT"
  else
    echo "$DIFF_OUTPUT"
  fi
}
