#!/usr/bin/env bash

set -euo pipefail

# Default values
start_ref=""
end_ref=""
repo_path="$(pwd)"
out_path=""
verbose="false"

# Print usage
usage() {
  echo "Usage: $0 [-start-ref <git-ref>] [-end-ref <git-ref>] [-repo-path <path>] [-out-path <file>] [-v]"
  exit 1
}

# Parse args
while [[ $# -gt 0 ]]; do
  case "$1" in
  -start-ref)
    start_ref="$2"
    shift 2
    ;;
  -end-ref)
    end_ref="$2"
    shift 2
    ;;
  -repo-path)
    repo_path="$2"
    shift 2
    ;;
  -out-path)
    out_path="$2"
    shift 2
    ;;
  -v)
    verbose="true"
    shift
    ;;
  *) usage ;;
  esac
done

# Validate repo
if [[ ! -d "$repo_path/.git" ]]; then
  echo "Error: '$repo_path' is not a valid Git repo." >&2
  exit 1
fi

cd "$repo_path"

# Fill in defaults
end_ref="${end_ref:-HEAD}"
start_ref="${start_ref:-$(
  git rev-parse "$end_ref"^{commit}^ 2>/dev/null ||
    {
      echo "Error: Unable to find previous commit of '$end_ref'" >&2
      exit 1
    }
)}"

# Validate refs
if ! git cat-file -e "$start_ref"^{commit} 2>/dev/null; then
  echo "Error: Invalid start-ref '$start_ref'" >&2
  exit 1
fi

if ! git cat-file -e "$end_ref"^{commit} 2>/dev/null; then
  echo "Error: Invalid end-ref '$end_ref'" >&2
  exit 1
fi

# Get diff
diff_output="$(git diff "$start_ref" "$end_ref")"

# Output
if [[ -n "$out_path" ]]; then
  echo "$diff_output" >"$out_path"
  if [[ "$verbose" == "true" ]]; then
    echo "$diff_output"
  fi
else
  echo "$diff_output"
fi
