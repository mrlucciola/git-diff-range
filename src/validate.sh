#!/bin/sh

# Params:
# 1. "$REPO_PATH"
#
# Called as: validate_repo "$REPO_PATH"
validate_repo() {
  repo_path="$1"

  if [ ! -d "$repo_path/.git" ]; then
    echo "Error: '$repo_path' is not a Git repo." >&2
    exit 1
  fi
}

# Params:
# 1. "$REPO_PATH"
# 2. "$REF"
#
# Called as: validate_git_ref "$REPO_PATH" "$REF"
validate_git_ref() {
  repo_path="$1"
  ref="$2"

  if [ -z "$ref" ]; then
    echo "Error: Missing git ref for validation" >&2
    exit 1
  fi

  if ! git -C "$repo_path" cat-file -e "$ref^{commit}" 2>/dev/null; then
    echo "Error: Invalid git ref '$ref'" >&2
    exit 1
  fi
}
