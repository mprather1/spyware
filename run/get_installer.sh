#!/usr/bin/env bash

get_installer(){
  printf "\nGetting installer...\n"
  
  dir=$(directory)/run/installer
  if [ ! -d $HOME/opt/bin ]; then
    mkdir -p $HOME/opt/bin
  fi

  if [ ! -d $dir ]; then
    git -C $(directory)/run clone --quiet https://github.com/shintech/installer 
    npm --prefix ./run/installer install run/installer    
    printf "#!/usr/bin/env bash\n\nHOME=\$HOME /usr/local/bin/node ${dir}/index.js \$(pwd) \$1" | sudo tee /usr/local/bin/installer > /dev/null 2>&1 && \
    sudo chmod +x /usr/local/bin/installer
  fi
}

install_scripts(){
  printf "Installing scripts...\n"
  
  scripts=($(directory)/scripts/*/*.sh)
  for script in "${scripts[@]}"; do
    installer $script
  done  
}

install_js(){
  printf "\nInstalling js...\n"

  if [ ! -d $(directory)/lib ]; then
    mkdir -p $(directory)/lib
  fi
  
  repositories=$(directory)/run/software_lists/lib.txt
  readarray repos < $repositories
    for repo in "${repos[@]}"; do
      dir=$(directory)$(echo $repo | cut -d' ' -f2-)
      if [ ! -d $dir ] 
        then
          printf "cloning ${repo##*/}\n"
          git -C $(dirname $dir) clone --quiet ${repo%.*}
          npm --prefix $(directory)/lib/${repo##*/} install $(directory)/lib/${repo##*/}
          installer $dir/package.json
        else
          printf "updating ${repo##*/}\n"
          git -C $dir pull --quiet origin master
      fi
    done  
}