#!/bin/bash
current_list=$(cat content/static/github_contributors.json | jq .)
while read p; do
    list_from_repo=$(curl -H "Accept: application/vnd.github.v3+json" "https://api.github.com/repos/$p/contributors" | jq 'map({login, avatar_url})')
    updated_list=$(jq --argjson arr1 "$current_list" --argjson arr2 "$list_from_repo" -n '$arr2 + $arr1 | unique_by(.login)')
    current_list=$updated_list
done <content/static/github_repositories.txt
echo "$updated_list" > content/static/github_contributors.json