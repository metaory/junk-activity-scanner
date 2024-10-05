#!/bin/bash

FOLLOWERS='1..2'
LANGUAGE=javascript
CREATED='>2024-04'
TOPICS=0
STARS=0
FORKS=0
LIMIT=3
QUERY=(
  'license:mit'
  'mirror:false'
  'archived:false'
  'template:false'
  "followers:${FOLLOWERS}"
  "language:${LANGUAGE}"
  "created:${CREATED}"
  "topics:${TOPICS}"
  "forks:${FORKS}"
  "stars:${STARS}"
)

Q=$(tr ' ' '+' <<<"${QUERY[*]}")
U="/search/repositories?q="
U+="${Q}&sort=updated&order=desc&per_page=$LIMIT"

gh api \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "$U" |
  jq '.items |
        map({
                name,
                full_name:.full_name|ascii_downcase,
                description,
                default_branch,
                type:.owner.type,
                login:.owner.login,
                size,
                ssh_url,
                created_at,
                updated_at
            })' > .tmp/search_result.json

 # gh search repos \
 #  --archived=false \
 #  --visibility=public \
 #  --sort=updated \
 #  --language=JavaScript \
 #  --created='>2024-04' \
 #  --number-topics='0' \
 #  --stars='0' \
 #  --json="$FIELDS" \
 #  --jq='map(.+{name,owner:.owner.login})' \
 #  --owner=erboladaiorg \
 #  --limit=3 |
