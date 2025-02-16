#!/usr/bin/env bash

cd ..
# git but not github
for d in $(ls); do
  # check if local git
  if [ ! -e $d/.git ]; then
    continue;
  fi
  pushd $d > /dev/null
  # check if remote repo
  git remote show origin > /dev/null 2>&1
  if [ $? -ne 0 ]; then
    echo $d
  fi;
  popd > /dev/null
done