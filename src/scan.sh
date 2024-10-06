#!/bin/bash

GH_API_VER='X-GitHub-Api-Version: 2022-11-28'
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
SEARCHPARAMS=(
  "q=$(tr ' ' '+' <<<"${QUERY[*]}")"
  "sort=updated"
  "order=desc"
  "per_page=$LIMIT"
)

mkdir -p /tmp/junk &>/dev/null || :

while read -r REPO; do
  read -r -d '\n' user name full_name default_branch < <(
    jq -r '.user,.name,.full_name,.default_branch' <<<"$REPO"
  )

  base="/tmp/junk/${user}/${name}"

  mkdir -p "$base" &>/dev/null || :

  jq '.' <<<"$REPO" >"${base}/detail.json"

  gh api \
    -H "Accept: application/vnd.github.raw+json" \
    -H "$GH_API_VER" \
    "/repos/${full_name}/git/trees/${default_branch}?recursive=true" |
    jq '.tree|map(select(.type == "blob"))|map([.path,.size,.sha])' |
    tee "${base}/tree.json"

  echo "indexed ${full_name}"
done < <(gh api \
  -H "Accept: application/vnd.github+json" \
  -H "$GH_API_VER" \
  "/search/repositories?$(tr ' ' '&' <<<"${SEARCHPARAMS[*]}")" |
  jq '.items |
          map({
                full_name:.full_name|ascii_downcase,
                name:.name|ascii_downcase,
                description,
                default_branch,
                size,
                ssh_url,
                type:.owner.type,
                user:.owner.login|ascii_downcase,
                created_at,
                updated_at
              })' |
  tee /tmp/junk/items.json |
  jq -c '.[]')

# vim: ft=bash
