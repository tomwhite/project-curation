#!/usr/bin/env bash

# git commit counts by project and date for main/master branches only
AUTHOR="${1:-$'Tom White'}"
echo "project,date,num_commits"
for d in $(ls); do
  # check if local git
  if [ ! -e $d/.git ]; then
    continue;
  fi
  pushd $d > /dev/null
  main=$(git branch | cut -c 3- | grep -E '^master$|^main$')
  git log $main --author="$AUTHOR" --date=short --pretty=format:"%ad" \
    | sort \
    | uniq -c \
    | awk -v proj=$d '{print proj,$2,$1}' OFS=,
  popd > /dev/null
done