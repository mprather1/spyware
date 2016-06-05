git add -A && git commit -m "${1}" && git push -u origin master
mplayer $current_directory/sounds/ding.wav > /dev/null 2>&1
echo "
All Done!!!
"
