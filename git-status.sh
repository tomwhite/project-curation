#!/usr/bin/env bash

cd ..
# whether project is in local git and github
echo "project,local_git,github"
for d in $(ls); do
  # check if local git
  if [ -e $d/.git ]; then
    local_git="Y"
  else
    local_git="N"
  fi
  pushd $d > /dev/null
  # check if remote repo
  git remote show origin > /dev/null 2>&1
  if [ $? -eq 0 ]; then
    github="Y"
  else
    github="N"
  fi;
  echo $d,$local_git,$github
  popd > /dev/null
done