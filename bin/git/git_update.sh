#!/usr/bin/env bash

git_update(){
  printf "\nInstalling system repositories from git...\n\n"
  repositories=$(directory)/bin/git/repos/repos.txt
  readarray repos < $repositories
    for repo in "${repos[@]}"; do
      if chkarg $repo; then
        dir=$(directory)/$(echo $repo | cut -d' ' -f2-)
        
        if [ ! -d $dir ] 
          then
            printf "cloning ${repo##*/}\n"
            git -C $(dirname $dir) clone --quiet ${repo%.*}
          else
            printf "updating ${repo##*/}\n"
            git -C $dir pull --quiet origin master
        fi
      fi
    done
    
  add_to_path
  
  echo "Done!!"
    
}

add_to_path(){
  /usr/bin/env bash $(directory)/bin/update-version/create.sh
  cp $(directory)/bin/update-version/update-version.default $(directory)/bin/update-version/update-version
  printf "\n/usr/bin/env bash $(directory)/bin/update-version/script.sh \$(pwd) \$1" >> $(directory)/bin/update-version/update-version
  sudo cp $(directory)/bin/update-version/update-version /usr/local/bin/update-version
}