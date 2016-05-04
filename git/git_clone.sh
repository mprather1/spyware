#echo "Username: "
#read name
echo "(1).Bitbucket or (2).Github?"
read a
#x = true
#while [ $x=true ]; do
  case $a in

  '1')
      echo "You chose Bitbucket!!!"
      choice="bitbucket.org"
      ;;

  '2')
      echo "You chose Github!!!"
      choice="github.com"
      ;;

    *) echo "Invalid Input!!!"

      ;;
  esac
#done
git clone git@$choice:$1/$2

echo "
All Done!!!
"
