sudo -u postgres createuser $1 -d -P
mplayer $current_directory/sounds/ding.wav > /dev/null 2>&1
echo "All Done!!"
