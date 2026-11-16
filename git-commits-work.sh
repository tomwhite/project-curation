#!/usr/bin/env bash

cd repos
# git commit counts by project and date for main branch only
echo "project,date,num_commits"
for d in $(ls); do
  # check if local git
  if [ ! -e $d/.git ]; then
    continue;
  fi
  proj=$d
  # old Hadoop history lives in a separate checkout; count it as hadoop
  if [ "$proj" = "hadoop-pre-HADOOP-4687" ]; then
    proj=hadoop
  fi
  pushd $d > /dev/null
  git log --author='Tom White' --author='Thomas White' --date=short --pretty=format:"%ad" \
    | sort \
    | uniq -c \
    | awk -v proj=$proj '{print proj,$2,$1}' OFS=,
  git log --grep tomwhite --grep 'Tom White' --date=short --pretty=format:"%ad" \
    | sort \
    | uniq -c \
    | awk -v proj=$proj '{print proj,$2,$1}' OFS=,
  popd > /dev/null
done