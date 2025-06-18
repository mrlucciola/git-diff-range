#!/bin/sh

# -----------------------------------------------------------------------------
# Function: handle_output
#
# Handles output logic based on OUT_PATH and VERBOSE settings.
#
# - If OUT_PATH is set, writes DIFF_OUTPUT to the file.
# - If VERBOSE is true, also prints the output to stdout.
# - If OUT_PATH is not set, prints DIFF_OUTPUT to stdout by default.
#
# Globals Used:
#   OUT_PATH, VERBOSE, DIFF_OUTPUT
# -----------------------------------------------------------------------------
handle_output() {
  if [ -n "$OUT_PATH" ]; then
    if ! printf "%s\n" "$DIFF_OUTPUT" >"$OUT_PATH"; then
      echo "Error: Failed to write to '$OUT_PATH'" >&2
      exit 1
    fi

    [ "$VERBOSE" = "true" ] && printf "%s\n" "$DIFF_OUTPUT"
  else
    printf "%s\n" "$DIFF_OUTPUT"
  fi
}
