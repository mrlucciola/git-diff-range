#!/bin/sh

# -----------------------------------------------------------------------------
# Entrypoint: main
#
# Orchestrates argument parsing, input validation, default resolution,
# Git diff computation, and output handling.
#
# Steps:
#   1. Parse arguments and set global vars
#   2. Validate Git repo path
#   3. Resolve missing defaults (e.g. HEAD, previous commit)
#   4. Validate Git refs
#   5. Run the diff
#   6. Handle console or file output
#
# Globals Used:
#   REPO_PATH, START_REF, END_REF, OUT_PATH, VERBOSE, DIFF_OUTPUT
#
# Exits:
#   On any invalid input, git failure, or file write error
# -----------------------------------------------------------------------------
main() {
  parse_args "$@"
  validate_repo "$REPO_PATH"
  resolve_defaults
  validate_git_ref "$REPO_PATH" "$END_REF"
  validate_git_ref "$REPO_PATH" "$START_REF"
  run_git_diff
  handle_output
}

main "$@"
