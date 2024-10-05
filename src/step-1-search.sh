#!/bin/bash

FOLLOWERS='1..2'
LANGUAGE=javascript
CREATED='>2024-04'
TOPICS=0
STARS=0
FORKS=0
LIMIT=100
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
echo "Q:: $Q"
echo "U:: $U"

# exit
gh api \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "$U" >./1_search_dumps/s9.json
