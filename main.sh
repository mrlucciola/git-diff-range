#!/bin/sh

# Entrypoint: calls `parse_args`, `run_git_diff`

# Source all modules
# SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
# for file in "$SCRIPT_DIR/src"/*.sh; do
#   . "$file"
# done

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
