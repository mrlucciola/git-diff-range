#!/bin/sh

validate_repo() {
  if [ ! -d "$1/.git" ]; then
    echo "Error: '$1' is not a Git repo." >&2
    exit 1
  fi
}

validate_git_ref() {
  if ! git -C "$1" cat-file -e "$2^{commit}" 2>/dev/null; then
    echo "Error: Invalid git ref '$2'" >&2
    exit 1
  fi
}
