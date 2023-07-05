#!/bin/bash

sudo apt-get -y update
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
apt-get install -y  --force-yes nodejs
#sudo apt install nodejs

#npm install -g npm

sudo apt-get -y install build-essential libtool autoconf automake uuid-dev
sudo apt-get -y install libzmq-dev libuv

wget https://github.com/zeromq/zeromq4-1/releases/download/v4.1.8/zeromq-4.1.8.tar.gz
tar xvzf zeromq-4.1.8.tar.gz
cd zeromq-4.1.8
./configure
make
sudo make install
sudo ldconfig


