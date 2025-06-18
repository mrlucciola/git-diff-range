#!/bin/sh

# Entrypoint: calls `parse_args`, `run_git_diff`

# Source all modules
. "$(dirname "$0")/parse-args.sh"
. "$(dirname "$0")/validate.sh"
. "$(dirname "$0")/defaults.sh"
. "$(dirname "$0")/git.sh"
. "$(dirname "$0")/output.sh"

main() {
  parse_args "$@"
  validate_repo "$REPO_PATH"
  validate_git_ref "$REPO_PATH" "$END_REF"
  validate_git_ref "$REPO_PATH" "$START_REF"
  resolve_defaults
  run_git_diff
  handle_output
}

main "$@"
