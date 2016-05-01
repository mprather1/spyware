#!/usr/bin/env bash

echo "Spyware installer..."
echo "Press any key to continue..."
read -n 1

current_directory="$(pwd)"

echo "
Creating .hushlogin file..."
touch ~/.hushlogin
echo "Done!!"

echo "Install Atom? y/n"
case $atom
  'y')
    echo "
    Adding repository for Atom:"
    sudo add-apt-repository ppa:webupd8team/atom -y
    sudo apt-get update
    sudo apt-get install atom
    echo "Done!!!"
    ;;
  *)
    echo "Skipping..."
    ;;
esac

echo "
Update and install software? y/n"
case $update_software in
  'y')
    sudo apt-get update
    sudo apt-get install -y openssh-server avahi-daemon clementine ftp ftpd autofs sshfs libreoffice lolcat cmatrix sl puddletag deluge keepass2 geany vlc samba soundconverter ubuntu-restricted-extras fortunes fortunes-off gimp agave steam thunderbird remmina virtualbox calibre gparted curl libsqlite3-dev git vim postgresql git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libpq-dev libffi-dev
    echo "
    Upgrading... "
    sudo apt-get upgrade -y
    echo "Done!!"
    ;;
  *)
    echo "Skipping update and software installation..."
    ;;
esac

echo "
Install encryption library? y/n"
case $encryption_library
  'y')
    sudo /usr/share/doc/libdvdread4/install-css.sh
    echo "Done!!"
    ;;
  *)
    echo "Skipping encryption library..."

echo "
Run .bashrc configuration? 'y/n'"
case $bashrc_configuration
  'y')
    echo ".bashrc file configuration..."
    cat bashrc.txt >> ~/.bashrc
    echo "Done!!"
    ;;
  *)
    echo "Skipping bashrc configuration..."
    ;;
esac

echo "Checking for .bash_aliases..."
if [ ! -f ~/.bash_aliases ]
  then
    echo "Creating .bash_aliases..."
    touch ~/.bash_aliases
    echo "
    Installing Spyware..."
    printf "alias spyware_update='cd ${current_directory} && git pull origin master'\n" >> ~/.bash_aliases
    printf "alias cloned='cd ${current_directory}/git_clone.sh\n" >> ~/.bash_aliases
    printf "alias gitd='cd ${current_directory}/git_commit.sh\n" >> ~/.bash_aliases
    printf "alias git_new='cd ${current_directory}/git_init.sh\n" >> ~/.bash_aliases
    printf "alias gitp='cd ${current_directory}/git_commit_push_master.sh\n" >> ~/.bash_aliases
    echo "Done!!"
  else
    echo ".bash_aliases already exits!!"
    echo "skipping..."
fi

echo "Checking for vim configuration..."
if [ ! -f ~/.vimrc ]
  then
    echo "Vim configuration..."
    mkdir ~/.vim
    cp -rv .vim/ ~/
    touch ~/.vimrc
    cat vimrc.txt >> ~/.vimrc
    echo "Done!!"
  else
    echo "Skipping vim configuration..."
fi

echo "
Do you want to run network configuration? y/n"
  case
    'y')
      echo "Enter desired static IP address: "
      read ip_address
      sudo cat network.txt > /etc/network/interfaces
      sudo echo "  address ${ip_address}" >> /etc/network/interfaces
      sudo /etc/init.d/networking restart
      echo "Done!!"
      ;;
    *)
      echo "Skipping network configuration..."
      ;;
esac

echo "Checking for id_rsa..."
if [ ! -f ~/.ssh/id_rsa ]
  then
    echo "
    Enter email address:"
    read email
    echo "Creating rsa key and adding to ssh agent..."
    ssh-keygen -t rsa -b 4096 -C "${email}"
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
    echo "Done!!"
  else
    echo "id_rsa already exists!!"
    echo "skipping..."
fi

echo "
Install make_shortcut and sshcopy? y/n"
case $custom
  'y')
    echo "
    Installing make_shortcut.."
    bash ./make_shortcut/install.sh
    echo "Done!!"

    echo "
    Installing sshcopy..."
    bash ./ssh-copy/ssh_copy.sh
    echo "Done!!"
    ;;
  *)
    echo "Skipping..."
    ;;
esac

echo "
All done!!"
echo "You must leave this file in the location where you ran the installer or face the consequences!!
Type 'spyware_update' in the terminal to update!!"
echo "
Go Fuck Yourself!!"

echo "Press any key to restart shell..."
read -n 1
exec $SHELL
