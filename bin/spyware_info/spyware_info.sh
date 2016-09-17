#!/usr/bin/env bash
source $(dirname $0)/../../data.sh

spyware_info(){
  echo "Type \"gitnew <username> <repository> <message>\" to create and push a new git repository!!"
  echo "Type \"cloned <username> <repository>\" to clone a git repository!!"
  echo "Type \"gitd <message>\" to commit to a local git repository!!"
  echo "Type \"gitp <message>\" to commit and push to a remote git repository!!"
  echo "Type \"curlrails <argument>\" into terminal to access rails server at localhost:3000!!"
  echo "Type \"shortcut <alias> '<command>'\" into terminal to create a shortcut!!"
  echo "Type \"sshcopy <alias> <username> <hostname>\" to setup password free ssh connection!!"
  echo "Type \"mountlocal <disk location> <mount point> <file system type>\" into terminal to mount a local hard disk!!"
  echo "Type \"mountautofs <name for mount point> <username> <remote hostname>\" to automount a disk with sshfs!!!"
  echo "Type \"createpsqluser <username>\" to create a postgresql user!!!"
  echo "Type \"specific_directory <alias> <user@hostname> <directory>\" for alias to ssh to specific directory!!"
  echo "Type \"network_config <device> <ip address>\" to configure network device!!"
  echo "Type \"boner\" or \"dicks\" if you are 14 years old and like to laugh!!"
  
  printf "Spyware is located at $(directory)..\n"
}
