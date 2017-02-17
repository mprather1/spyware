source $(dirname $0)/../data.sh

if chkarg $2; then
  user=$(whoami)
  cd ~
  git clone git://github.com/c9/core.git c9sdk
  cd c9sdk
  scripts/install-sdk.sh
  printf "alias cloud9='pm2 start $(pwd)/server.js -x -- -p 8080 -a $1:$2 --listen 0.0.0.0 -w /home/$user/Development'\n" >> ~/.bash_aliases
else
  printf "Please include username and password..."
fi
