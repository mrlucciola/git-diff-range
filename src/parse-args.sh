#!/bin/sh

# -----------------------------------------------------------------------------
# Function: parse_args
#
# Parses CLI arguments into global variables.
#
# This function expects to be called with all CLI arguments (i.e. "$@").
# It supports the following optional flags:
#
#   -start-ref <git-ref>   : Starting Git reference (commit hash, branch, etc.)
#   -end-ref   <git-ref>   : Ending Git reference (defaults to HEAD if unset)
#   -repo-path <path>      : Filesystem path to Git repo (defaults to cwd)
#   -out-path  <file>      : File to write output to (if unset, prints to stdout)
#   -v                     : Verbose mode — prints to console even if out-path is set
#
# All values are stored in global variables:
#   START_REF, END_REF, REPO_PATH, OUT_PATH, VERBOSE
#
# Globals Set:
#   START_REF, END_REF, REPO_PATH, OUT_PATH, VERBOSE
#
# Called as:
#   parse_args "$@"
# -----------------------------------------------------------------------------
parse_args() {
  START_REF=""
  END_REF=""
  REPO_PATH="$(pwd)"
  OUT_PATH=""
  VERBOSE="false"

  while [ $# -gt 0 ]; do
    case "$1" in
    -start-ref)
      [ $# -lt 2 ] || echo "$2" | grep -q '^-' && {
        echo "Error: -start-ref requires a value" >&2
        exit 1
      }
      START_REF="$2"
      shift 2
      ;;
    -end-ref)
      [ $# -lt 2 ] || echo "$2" | grep -q '^-' && {
        echo "Error: -end-ref requires a value" >&2
        exit 1
      }
      END_REF="$2"
      shift 2
      ;;
    -repo-path)
      [ $# -lt 2 ] || echo "$2" | grep -q '^-' && {
        echo "Error: -repo-path requires a value" >&2
        exit 1
      }
      REPO_PATH="$2"
      shift 2
      ;;
    -out-path)
      [ $# -lt 2 ] || echo "$2" | grep -q '^-' && {
        echo "Error: -out-path requires a value" >&2
        exit 1
      }
      OUT_PATH="$2"
      shift 2
      ;;
    -v)
      VERBOSE="true"
      shift
      ;;
    -h | --help)
      print_help
      exit 0
      ;;
    *)
      echo "Error: Unknown argument: $1" >&2
      print_help >&2
      exit 1
      ;;
    esac
  done
}
