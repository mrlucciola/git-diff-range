#!/bin/sh

parse_args() {
  START_REF=""
  END_REF=""
  REPO_PATH="$(pwd)"
  OUT_PATH=""
  VERBOSE="false"

  while [ $# -gt 0 ]; do
    case "$1" in
    -start-ref)
      START_REF="$2"
      shift 2
      ;;
    -end-ref)
      END_REF="$2"
      shift 2
      ;;
    -repo-path)
      REPO_PATH="$2"
      shift 2
      ;;
    -out-path)
      OUT_PATH="$2"
      shift 2
      ;;
    -v)
      VERBOSE="true"
      shift
      ;;
    *)
      echo "Invalid argument: $1" >&2
      exit 1
      ;;
    esac
  done
}
