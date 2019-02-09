# spyware

## Synopsis

* Installs useful software
* Configures .bashrc with a greeting and colorful prompt.
* Configures .bash_aliases with useful shortcuts.
* Creates rsa key with email address appended to the end.
* Configures vim with useful plugins.
* Does not really install spyware.

## Installation

* XUbuntu 16.04
* Ubuntu Server 16.04
* Raspbian Jessie Lite

Put spyware folder in desired location and open a terminal in the folder. 

    bash install.sh
  
Leave the folder in the location where the installer was ran or it will break some of the aliases.
If the folder needs to be moved then the installer can be ran again in the new location.
The installer can safely be ran anytime if autofs.config and bashrc.config exist in the root folder. 

### How to do a clean installation

If something is broken, especially in the Node.js scripts located in the lib directory. It might be useful to do a full reinstall.

    # Step 1 - remove the lib directory
    rm -vfr ~/spyware/lib
    
    # Step 2 - remove the bashrc.config file. - Don't do this if you have edited your .bashrc file. It will be replaced.
    rm ~/spyware/bashrc.config
    
    # Step 3 - run the install script again
    ./install.sh

## Usage

    gitnew <username> <repository> <message> # create and push a new git repository
    cloned <username> <repository> # clone a git repository
    gitp <message> # commit and tag to a git repository
    gpush # to push git repository and tags
    curlrails <argument> # access rails server at localhost:3000
    shortcut <alias> '<command>' # create a shortcut
    sshcopy <alias> <username> <hostname> # copy ssh keys and create shortcut
    mountlocal <disk location> <mount point> <file system type> # mount a local hard disk
    mountautofs <name for mount point> <username> <remote hostname> # automount a disk with sshfs
    createpsqluser <username>\ # create a postgresql user
    specific_directory <alias> <user@hostname> <directory> # create alias to ssh to specific directory
    network_config <device> <ip address>\ # configure network device
    
### TODO
    
* docker installation
* c9 installation
* update repos to 18.04
* fail2ban
