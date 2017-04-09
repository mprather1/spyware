# Docker Installation

https://github.com/docker/compose/releases

### Docker

    sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
    sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
    sudo apt-get install -y docker-engine

# Docker Compose

    curl -L https://github.com/docker/compose/releases/download/1.12.0-rc2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose

### user docker without sudo 

    sudo usermod -aG docker $(whoami)

### check if docker is running

    sudo systemctl status docker

### start docker if necessary

    sudo systemctl start docker 

### restart 

    sudo systemctl restart docker