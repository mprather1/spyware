#!/usr/bin/env bash

curl_rails="Type 'curlrails <argument>' into terminal to access rails server at localhost:3000!!"
make_shortcut="Type 'shortcut' into terminal to create a shortcut!!"
sshcopy="Type 'sshcopy <alias> <username> <hostname>' to setup password free ssh connection!!"
installation_shortcut="Type 'installnow <arguments>' into terminal to install software with apt-get!!"
mount_local_drive="Type 'mountlocal <mount point> <disk location> <type>' into terminal to mount a local hard disk!!"
autosshfs="Type 'mountautofs <mount point name> <username> <remote hostname>' to automount a disk with sshfs!!"

echo "Spyware installer..."
echo "Tested on Xubuntu 15.10 and Ubuntu Server 15.10..."
echo "Press any key to continue..."
read -n 1

user=$(whoami)
user_id=$(id -u $user)
group_id=$(id -g $user)
current_directory="$(pwd)"
prompt=">>> "

echo "Creating .hushlogin..."
touch ~/.hushlogin
echo "Done!!"

if [ ! -f installed.txt ] && [ -f /usr/lib/xorg ]
  then
    echo "Installing Ubuntu Desktop software..."
    sudo add-apt-repository ppa:webupd8team/atom -y
    sudo add-apt-repository ppa:chris-lea/node.js -y
    sudo apt-get update && sudo apt-get install -y openssh-server avahi-daemon clementine ftp ftpd autofs sshfs libreoffice lolcat cmatrix sl puddletag deluge keepass2 geany vlc samba soundconverter ubuntu-restricted-extras fortunes fortunes-off gimp agave steam thunderbird remmina virtualbox calibre gparted curl libsqlite3-dev git vim postgresql git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libpq-dev libffi-dev libpq-dev pv toilet rig libaa-bin espeak nodjs chromium-browser eclipse tuxguitar && sudo apt-get upgrade -y
    sudo /usr/share/doc/libdvdread4/install-css.sh
    touch installed.txt
    echo "Done"
fi

if [ ! -f installed.txt ] && [ ! -f /usr/lib/xorg ]
  then
    echo "Installing Ubuntu Server software..."
    sudo add-apt-repository ppa:chris-lea/node.js -y
    sudo apt-get update && sudo apt-get install -y cmatrix sl lolcat fortunes fortunes-off curl git openssh-server avahi-daemon autofs sshfs vim postgresql git-core curl zlib1g-dev libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev build-essential libpq-dev pv toilet rig libaa-bin nodejs && sudo apt-get upgrade -y
    touch installed.txt
    echo "Done!!!"
fi

echo "
Checking for .bashrc configuration..."
sleep 1
if [ ! -f bashrc_configuration.txt ]
  then
    echo ".bashrc file configuration..."
    sleep 1
    cat bashrc.txt >> ~/.bashrc
    touch bashrc_configuration.txt
    echo "Done!!"
  else
    echo ".bashrc configuration has already been run..."
    echo "skipping..."
    sleep 1
fi


echo "
Checking for .bash_aliases..."
sleep 1
if [ ! -f ~/.bash_aliases ]
  then
    echo "Creating .bash_aliases..."
    sleep 1
    touch ~/.bash_aliases
    cat aliases.txt > ~/.bash_aliases
    echo " "
    echo "Installing Spyware..."
    sleep 1

    printf "alias spyware_update='cd ${current_directory} && git pull origin master'\n" >> ~/.bash_aliases

    declare -A scripts
      scripts[cloned]=/git/git_clone.sh
      scripts[gitd]=/git/git_commit.sh
      scripts[gitnew]=/git/git_init.sh
      scripts[gitp]=/git/git_commit_push_master.sh
      scripts[curlrails]=/curl_rails/curl_rails.sh
      scripts[shortcut]=/make_shortcut/make_shortcut.sh
      scripts[sshcopy]=/ssh_copy/ssh_copy.sh
      scripts[installnow]=/installation_shortcut/installation_shortcut.sh
      scripts[mountlocal]=/mount_local_drive/mount_local_drive.sh
      scripts[mountautofs]=/autosshfs/autosshfs.sh
    for c in "${!scripts[@]}"; do
      printf "alias %s='bash ${current_directory}%s'\n" "$c" "${scripts[$c]}" >> ~/.bash_aliases
    done
    echo "Done!!"
  else
    echo ".bash_aliases already exits..."
    echo "skipping..."
    sleep 1
fi

echo "
Checking for vim configuration..."
sleep 1
if [ ! -f ~/.vimrc ]
  then
    echo "Vim configuration..."
    sleep 1
    mkdir ~/.vim
    cp -rv .vim/ ~/
    touch ~/.vimrc
    cat vimrc.txt >> ~/.vimrc
    echo "Done!!"
  else
    echo "vim is already configured..."
    echo "skipping..."
    sleep 1
fi

echo "
Checking for id_rsa..."
sleep 1
if [ ! -f ~/.ssh/id_rsa ]
  then
    echo "
    id_rsa does not exist, creating..."
    sleep 1
    echo "Enter email address:"
    read -p "${prompt}" email
    echo "Creating rsa key and adding to ssh agent..."
    ssh-keygen -t rsa -b 4096 -C "${email}"
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
    echo "Done!!"
  else
    echo "id_rsa already exists..."
    echo "skipping..."
    sleep 1
fi

echo "
Checking for autofs..."
sleep 1
if [ -f /usr/share/autofs/conffiles/default/autofs ] && [ ! -f autofs_configuration.txt ]
  then
    echo "Configuring autofs for sshfs..."
    sleep 1
    printf "/mnt /etc/auto.sshfs uid=${user_id},git=${group_id},--timeout=30,--ghost\n" | sudo tee -a /etc/auto.master
    touch autofs_configuration.txt
  else
    echo "autofs already configured..."
    echo "skipping..."
    sleep 1
fi

echo "
Mouse configuration..."
echo "Checking for Kingsis Peripherals Evoluent VerticalMouse 3..."
sleep 1
for id in $(xinput --list | \
          sed -n '/Kingsis Peripherals  Evoluent VerticalMouse 3.*pointer/s/.*=\([0-9]\+\).*/\1/p')
do
  if [ ! -z ${id+x} ] && [ ! -f mouse_configuration.txt ]
    then
      button_map="xinput set-button-map ${id} 1 2 3 4 5 6 7 9 8"
      echo $button_map > mouse_configuration/mouse_configuration.sh
      var=$(sed '$d' /etc/rc.local)
      printf "${var}" | sudo tee /etc/rc.local
      printf "\nbash ${current_directory}/mouse_configuration/mouse_configuration.sh\nexit 0" | sudo tee -a /etc/rc.local
      touch mouse_configuration.txt
    else
      echo "Kingsis Peripherals Evoluent VerticalMouse 3 not found..."
      echo "skipping..."
      sleep 1
  fi
done

echo "
Checking for network configuration..."
sleep 1
if [ ! -f network_configuration.txt ] && [ -f /usr/lib/xorg ]
  then
    echo "Configuring network..."
    sudo sh -c "cat network.txt > /etc/network/interfaces"
    echo " "
    echo "Enter desired static IP address: "
    read ip_address
    printf "  address ${ip_address}" | sudo tee -a /etc/network/interfaces
    touch network_configuration.txt
    printf "\nDone!!"
  else
    echo "Skipping network configuration..."
    sleep 1
fi

printf "\n\n"
if [ -f /usr/bin/pv ]
  then
    echo "Spyware has been successfully installed..." | pv -qL 15
  else
    echo "Spyware has been successfully installed..."
fi

echo "
You must leave this file in the location where you ran the installer or face the consequences!!"
echo "
Type 'spyware_update' in the terminal to update this script!!"

echo $make_shortcut
echo $sshcopy
echo $installation_shortcut
echo $mount_local_drive
echo $curl_rails
echo $autosshfs

echo "
Please restart shell and networking for changes to take effect..."
echo "
Go Fuck Yourself!!"
echo "Press any key to exit..."
read -n 1
