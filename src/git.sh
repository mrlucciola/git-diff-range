#!/bin/sh

run_git_diff() {
  cd "$REPO_PATH"
  DIFF_OUTPUT=$(git diff "$START_REF" "$END_REF")
}
