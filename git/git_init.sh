#!/usr/bin/env bash

git init && git add -A && git commit -m "${3}" && git remote add origin git@github.com:$1/$2.git && git push -u origin master

echo "
All Done!!!
"
