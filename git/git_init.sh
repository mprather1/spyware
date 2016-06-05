git init && git add -A && git commit -m "${3}" && git remote add origin git@github.com:$1/$2.git && git push -u origin master
mplayer $current_directory/sounds/ding.wav > /dev/null 2>&1
echo "
All Done!!!
"
