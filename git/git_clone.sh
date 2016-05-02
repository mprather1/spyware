#echo "Username: "
#read name

echo "Name of repository: "
read repository
echo "(1).Bitbucket or (2).Github?"
read a
#x = true
#while [ $x=true ]; do
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
git clone git@$choice:mprather1/${repository}

echo "
All Done!!!
"
