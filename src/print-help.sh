#!/bin/sh

print_help() {
  cat <<EOF
Usage: git-diff-range [OPTIONS]

Generate a git diff between two refs, with optional output file and verbosity.

Options:
  -start-ref <ref>   Git ref to start from (e.g. HEAD~1, abc123). Default: previous commit.
  -end-ref <ref>     Git ref to end at. Default: HEAD.
  -repo-path <path>  Path to git repository. Default: current directory.
  -out-path <file>   Path to file to write output to. If unset, prints to stdout.
  -v                 Verbose output — always print diff to stdout.
  -h, --help         Show this help message.

Examples:
  git-diff-range -start-ref HEAD~3 -end-ref HEAD
  git-diff-range -repo-path ~/projects/my-repo -out-path changes.diff -v

EOF
}
