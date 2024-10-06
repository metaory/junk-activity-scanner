#!/bin/bash
set -Eeuo pipefail

[ -t 0 ] && {
  echo ' [ERROR] STREAM IS INTERACTIVE
  try running
    cat sample_input.json | bash main.sh'
  exit
}

declare INPUT

while read -r L; do INPUT+=$L; done

echo "evaluating ..."

jq '.' <<< "$INPUT"

#  ...
#  .. INSPECT LOGIC ..
#  ☇ DEMONSTRATION PURPOSE

echo "0.87"

# vim: ft=bash
