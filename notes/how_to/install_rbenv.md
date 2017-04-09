## rbenv installation

### clone repositories and install

    git clone git://github.com/sstephenson/rbenv.git .rbenv
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /home/mike/.bashrc
    echo 'eval "$(rbenv init -)"' >> /home/mike/.bashrc
    exec $SHELL
    
    git clone git://github.com/sstephenson/ruby-build.git .rbenv/plugins/ruby-build
    echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> /home/mike/.bashrc
    exec $SHELL
    
    git clone git://github.com/sstephenson/rbenv-gem-rehash.git .rbenv/plugins/rbenv-gem-rehash
    
    rbenv install ruby_version
    rbenv global ruby_version
    rbenv shell ruby_version

### no documentation for gems
  
    echo "gem: --no-document" > ~/.gemrc

### rails
  
    gem install rails --version=x.x.x
    gem install bundler
