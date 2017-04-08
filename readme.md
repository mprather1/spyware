# spyware

## Synopsis

Installs useful software for either XUbuntu 15.10 or Ubuntu Server.
Configures .bashrc with a greeting and colorful prompt.
Configures .bash_aliases with useful shortcuts.
Creates rsa key with email address appended to the end.
Configures vim with useful plugins.
Does not really install spyware.

## Installation

Put spyware folder in desired location and open a terminal in the folder. 

  bash install.sh
  
Leave the folder in the location where the installer was ran or it will break some of the aliases.
If the folder needs to be moved then the installer can be ran again in the new location.
The installer can safely be ran anytime if autofs.config and bashrc.config exist in the root folder.  

## Usage

Type \gitnew <username> <repository> <message>\ to create and push a new git repository!!
Type \cloned <username> <repository>\ to clone a git repository!!
Type \gitd <message>\ to commit to a local git repository!!
Type \gitp <message>\ to commit and push to a remote git repository!!
Type \curlrails <argument>\ into terminal to access rails server at localhost:3000!!
Type \shortcut <alias> '<command>'\ into terminal to create a shortcut!!
Type \sshcopy <alias> <username> <hostname>\ to setup password free ssh connection!!
Type \mountlocal <disk location> <mount point> <file system type>\ into terminal to mount a local hard disk!!
Type \mountautofs <name for mount point> <username> <remote hostname>\ to automount a disk with sshfs!!!
Type \createpsqluser <username>\ to create a postgresql user!!!
Type \specific_directory <alias> <user@hostname> <directory>\ for alias to ssh to specific directory!!
Type \network_config <device> <ip address>\ to configure network device!!