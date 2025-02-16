#!/usr/bin/env bash

cd ..
# Not in git
for d in $(ls); do if [ ! -e $d/.git ]; then echo $d; fi;  done