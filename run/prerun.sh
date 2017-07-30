#!/usr/bin/env bash

get_installer(){
  dir=$(directory)/bin/installer
  if [ ! -d $dir ]; then
    git -C $(dirname $dir) clone --quiet https://github.com/shintech/installer && \
    npm install $dir && \
    printf "#!/usr/bin/env bash\n\nHOME=\$HOME /usr/local/bin/node ${dir}/index.js \$1" | sudo tee /usr/local/bin/installer > /dev/null 2>&1 && \
    sudo chmod +x /usr/local/bin/installer
  fi
}