#!/bin/bash

# /repos/{owner}/{repo}/contents/{path}


full_name="redzooo/wallopadonkeyaerialphotography"
full_name='taktikorg/distinctio-dolore'
# full_name='astraloa/kakao-sessionlib'

# U=/repos/OWNER/REPO/contents/.github
# U="/repos/${full_name}/contents/.github/"
U="/repos/${full_name}/git/trees/main"
U+="?recursive=true"
# /repos/OWNER/REPO/git/trees/TREE_SHA


gh api \
  -H "Accept: application/vnd.github.raw+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "$U" | jq '.' | tee .tmp/search_trees.json


  # "fullName": "taktikorg/distinctio-dolore",

  exit

while read -r REPO; do
  echo
  echo "LL :: $REPO"
  jq -r '.full_name' <<< "$REPO"
  echo
done < <( jq -c '.[]' .tmp/search_result.json)
