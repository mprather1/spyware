#!/usr/bin/env bash

echo "Spyware installer..."
echo "Press any key to continue or CTRL+C to exit..."
read -n 1

current_directory="$(pwd)"

echo "
Enter email address:"
read email

echo "Enter desired static IP address: "
read ip_address

echo "
Creating .hushlogin file..."
touch ~/.hushlogin
echo "Done!!"

echo "
Update and install software..."
sudo apt-get update
sudo apt-get install -y openssh-server avahi-daemon clementine ftp ftpd autofs sshfs libreoffice lolcat cmatrix sl puddletag deluge transmission keepass2 vlc samba soundconverter ubuntu-restricted-extras fortunes fortunes-off gimp agave steam thunderbird remmina virtualbox calibre gparted curl git vim libdvdread4
echo "Done!!"

echo "
Installing encryption library..."
sudo /usr/share/doc/libdvdread4/install-css.sh
echo "Done!!"

echo "
Create Bash Aliases..."
touch ~/.bash_aliases
cat aliases.txt >> ~/.bash_aliases
echo "Done!!"

echo "
.bashrc file configuration..."
cat bashrc.txt >> ~/.bashrc
echo "Done!!"

echo "
Vim configuration..."
mkdir ~/.vim
cp -rv .vim/ ~/
touch ~/.vimrc
cat vimrc.txt >> ~/.vimrc
echo "Done!!"

echo "Checking for id_rsa..."
if [ ! -f ~/.ssh/id_rsa ]
  then
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
Network configuration..."
sudo cat network.txt > /etc/network/interfaces
sudo echo "  address ${ip_address}" >> /etc/network/interfaces
sudo /etc/init.d/networking restart
echo "Done!!"

echo "
Upgrading... "
sudo apt-get upgrade -y
echo "Done!!"

echo "
Installing make_shortcut.."
bash ./make_shortcut/install.sh
echo "Done!!"

echo "
Installing sshcopy..."
bash ./ssh-copy/ssh_copy.sh
echo "Done!!"

echo "
Installing Spyware..."
printf "alias spyware_update='cd ${current_directory} && git pull origin master'\n" >> ~/.bash_aliases
echo "Done!!"

echo "
All done!!"
echo "Type 'spyware_update' in the terminal to update!!"
echo "
Go Fuck Yourself!!"

echo "Press any key to restart shell..."
read -n 1
exec $SHELL
