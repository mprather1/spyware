#!/usr/bin/env bash

user=$(whoami)
user_id=$(id -u $user)
group_id=$(id -g $user)
current_directory="$(pwd)"
printf "printf \"${current_directory}\"\n}" >> current_directory.sh
source $(dirname $0)/current_directory.sh
for f in $(dirname $0)/run/*.sh; do source $f; done;
prompt=">>> "

echo "Spyware installer..."
echo "Tested on Xubuntu 15.10 and Ubuntu Server 15.10..."
echo "Press any key to continue..."
read -n 1

echo "Creating .hushlogin..."
touch ~/.hushlogin
echo "Done!!"

echo "
Software installation..."
echo "1.) Desktop 2.) Server *.) Skip"
read -p "${prompt}" update_software
case $update_software in
  "1")
    echo "Installing Ubuntu Desktop software..."
      install_desktop_software
    echo "Done"
    ;;
  "2")
    echo "Installing Ubuntu Server software..."
      install_server_software
    echo "Done!!!"
    ;;
  *)
    echo "skipping..."
    ;;
esac

echo "Install synergy and xscreensaver? y/n"
read synergy
case $synergy in
  "y")
    echo "Installing..."
    sudo dpkg -i misc/synergy.deb misc/xscreensaver.deb
    ;;
  *)
    echo "skipping..."
    ;;
esac

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
    create_bash_aliases
  else
    echo ".bash_aliases already exits..."
    echo "skipping..."
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
if [ -f /etc/auto.master ] && [ ! -f autofs_configuration.txt ]
  then
    echo "Configuring autofs for sshfs..."
    sleep 1
    printf "/mnt /etc/auto.sshfs uid=${user_id},gid=${group_id},--timeout=30,--ghost\n" | sudo tee -a /etc/auto.master
    touch autofs_configuration.txt
  else
    echo "skipping..."
    sleep 1
fi

echo "
Mouse configuration..."
echo "Checking for xinput..."
sleep 1
if [ -f /usr/bin/xinput ]; then
  for id in $(xinput --list | \
            sed -n '/Kingsis Peripherals  Evoluent VerticalMouse 3.*pointer/s/.*=\([0-9]\+\).*/\1/p')
  do
    if [ ! -z ${id+x} ]; then
        echo "Configuring Kingsis Peripherals Evoluent VerticalMouse 3..."
        sleep 1
        button_map="xinput set-button-map ${id} 1 2 3 4 5 6 7 9 8"
        touch ~/.xsessionrc
        printf "#!/usr/bin/env bash\n\n${button_map}" > ~/.xsessionrc
      else
        echo "Evoluent VerticalMouse not found, skipping mouse configuration..."
        sleep 1
    fi
  done
else
  echo "xinput not found skipping..."
  sleep 1
fi

echo "
Installing Spyware..."
sleep 1

sudo cp -r themes/* /usr/share/themes
sudo cp -r wallpaper/* /usr/share/xfce4/backdrops

touch ~/.gtkrc-2.0
cat gtkrc.txt > ~/.gtkrc-2.0

printf "\nmy \$current_directory = '$(directory)';\n" >> die/death.pl
cat die/death.txt >> die/death.pl

echo "Done"

echo "
Do you want to run network configuration? y/n"
read -p "${prompt}" network_configuration
case $network_configuration in
  "y")
    echo "Configuring network..."
    sleep 1
    sudo sh -c "cat network.txt > /etc/network/interfaces"
    echo " "
    echo "Enter desired static IP address: "
    read ip_address
    printf "  address ${ip_address}" | sudo tee -a /etc/network/interfaces
    printf "\nDone!!"
    ;;
  *)
    echo "Skipping network configuration..."
    sleep 1
    ;;
esac

printf "\n"
if [ -f /usr/bin/pv ]
  then
    echo "Spyware has been successfully installed..." | pv -qL 15
  else
    echo "Spyware has been successfully installed..."
fi

echo "
You must leave this file in the location where you ran the installer or face the consequences!!"
echo "
Please restart shell and networking for changes to take effect..."
echo "
Go Fuck Yourself!!"
echo "Press any key to exit..."
read -n 1
