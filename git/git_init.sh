#!/bin/bash

echo "Enter message: "
read message
echo "Enter remote repository: "
read remoter
echo "(1).Bitbucket or (2).Github?"
read a
#x = true
#while [ $x = true ]; do
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
git init && git add -A && git commit -m "${message}" && git remote add origin git@$choice:mprather1/${remoter}.git && git push -u origin master

echo "
All Done!!!
"
