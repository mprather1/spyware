#!/bin/bash

echo "(1).Bitbucket or (2).Github?"
read a
  case $a in
  '1')
      echo "You chose Bitbucket!!!"
      choice="bitbucket.org"
#      x = false
      ;;
  '2')
      echo "You chose Github!!!"
      choice="github.com"
#      x = false
      ;;
  *) echo "Invalid Input!!!"
      ;;

  esac
#done
git init && git add -A && git commit -m "${3}" && git remote add origin git@$choice:$1/$2.git && git push -u origin master

echo "
All Done!!!
"
