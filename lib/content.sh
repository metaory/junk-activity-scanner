#!/bin/bash

GH_API_VER='X-GitHub-Api-Version: 2022-11-28'

FULL_NAME="${1:?MISS_REPO}"
FULL_PATH="${2:?MISS_PATH}"

echo "FULL_NAME $FULL_NAME"
echo "FULL_PATH $FULL_PATH"

exit


gh api \
  -H "Accept: application/vnd.github.raw+json" \
  -H "$GH_API_VER" \
  "/repos/${FULL_NAME}/contents/${FULL_PATH}"

# vim: ft=bash
