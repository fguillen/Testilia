#!/bin/bash
set -e
set -x

apt-get update
apt-get install git-core

# Install Docker
# From here: https://docs.docker.com/install/linux/docker-ce/ubuntu/#set-up-the-repository
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get install docker-ce

# Docker compose
# From here: https://docs.docker.com/compose/install/
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

# Download the App
mkdir -p /var/apps
cd /var/apps
git clone https://github.com/fguillen/Testilia.git TestNauticos

# Start the App
cd /var/apps/TestNauticos
docker-compose build
docker-compose up -d
docker-compose exec app bundle exec rake db:create db:schema:load
# docker-compose exec app bundle exec rake db:seed # Optional
