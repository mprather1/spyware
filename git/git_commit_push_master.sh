#!/bin/bash

echo "Enter message: "
read message

git add -A && git commit -m "${message}" && git push -u origin master

echo "
All Done!!!
" 
