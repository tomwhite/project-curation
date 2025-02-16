#!/usr/bin/env bash

cd ..
# git dirty status
for d in $(ls); do
    if [ ! -e $d/.git ]; then
        continue;
    fi
    pushd $d > /dev/null
    y=$(git status -s | wc -l)
    if [ $y -ne 0 ]; then
      echo "$d"
    fi
    popd > /dev/null
done