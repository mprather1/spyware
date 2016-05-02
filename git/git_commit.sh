#!/bin/bash

echo "Enter message: "
read message

git add -A && git commit -m "${message}"

echo "
All Done!!!
" 
