black="\033[00;30m"
grey="\033[01;30m"
light_blue="\033[01;34m"
blue="\033[00;34m"
dark_purple="\033[00;35m"
light_purple="\033[01;35m"
light_cyan="\033[01;36m"
cyan="\033[00;36m"
light_green="\033[01;32m"
green="\033[00;32m"
light_red="\033[01;31m"
red="\033[00;31m"
brown="\033[00;33m"
yellow="\033[01;33m"
white="\033[00;37m"
NC='\033[0m'

colors=("\033[01;34m" "\033[00;34m" "\033[00;35m" "\033[01;35m" "\033[01;36m" "\033[00;36m" "\033[01;32m" "\033[00;32m" "\033[01;31m" "\033[00;31m" "\033[00;33m" "\033[01;33m")

random_color(){
  num=$(shuf -i 0-11 -n  1)
  echo ${colors[num]}
}

chkarg(){
  if [ ! -z ${1+x} ]; then
    return 0
  else
    return 1
  fi
}

not_installed(){
  package=$(dpkg -s $1 | grep 'Status')
  if [ -z "${package}"  ]
    then
      printf "${1} is not installed...\ninstalling...\n\n"
      sleep 1
      return 0
    else
      printf "${1} is installed...\nskipping...\n\n" 
      sleep 1
      return 1 
  fi
}

repo_not_installed(){
  IFS=":" read -a repo_name <<< "$1"
  if ! grep -q "${repo_name[1]}" /etc/apt/sources.list /etc/apt/sources.list.d/*
    then
      printf "${1} is not installed...\ninstalling...\n\n"  
      sleep 1
      return 0
    else 
      printf "${1} is installed...\nskipping...\n\n"
      sleep 1
      return 1
  fi
}
