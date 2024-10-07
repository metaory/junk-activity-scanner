#!/bin/bash

GH_API_VER='X-GitHub-Api-Version: 2022-11-28'

FULL_NAME="${1:?MISS_REPO}"
FULL_PATH="${2:?MISS_PATH}"
FILE_PATH="/tmp/junk/${FULL_NAME}/${FULL_PATH}"

mkdir -p "$(dirname $FILE_PATH)" &>/dev/null || :

if [ -f "$FILE_PATH" ]; then
  echo "$FILE_PATH"
  exit 0
fi

gh api \
  -H "Accept: application/vnd.github.raw+object" \
  -H "$GH_API_VER" \
  "/repos/${FULL_NAME}/contents/${FULL_PATH}" > "${FILE_PATH}"

echo "$FILE_PATH"

# vim: ft=bash
