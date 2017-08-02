#!/usr/bin/env bash

get_installer(){
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
  scripts=($(directory)/scripts/*/*.sh)
  for script in "${scripts[@]}"; do
    installer $script
  done  
}