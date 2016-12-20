#!/bin/bash
#########################################################################
#
# stuff I like to be there after install Linux Mint Serena 18.1 Cinnamon
#
#########################################################################
# install linuxbrew dependencies
sudo apt-get -y install build-essential curl git python-setuptools ruby

# install ipython dependencies
sudo apt-get -y install python2.7 python-pip python-dev virtualenv python-tk

# can't live without this stuff
sudo apt-get -y install zsh gitk
sudo add-apt-repository ppa:jonathonf/vim
sudo apt-get update
sudo apt-get -y install vim vim-gtk3-py2

# install ripgrep - the best tool for search.
# brew version requires rust compiler to be compiled
# which takes a whole lot of CPU and time to get done.
# get static linked binary instead
cd /tmp
wget https://github.com/BurntSushi/ripgrep/releases/download/0.3.2/ripgrep-0.3.2-i686-unknown-linux-musl.tar.gz
tar -xvzf ripgrep-0.3.2-i686-unknown-linux-musl.tar.gz
cd ripgrep-0.3.2
chmod +x rg
mv rg /usr/local/bin/
mv rg.1 /usr/local/share/man/

# install docker
sudo apt-get -y install virtualbox
sudo apt-get -y install apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual
sudo apt-get install docker-engine
pip install docker-compose
sudo groupadd docker
sudo usermod -aG docker $USER


#install brew and main packages
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
brew install gcc
brew doctor
brew install maven
brew install hugo tig tmux fzf jq
brew install node 
npm install -g bower
npm install -g gulp


