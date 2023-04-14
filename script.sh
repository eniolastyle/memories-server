#!/usr/bin/env bash

echo "
----------------------
  NODE & NPM
----------------------
"

sudo apt-get purge nodejs || true
sudo apt-get autoremove || true
sudo apt-get remove nodejs || true

dpkg -l | grep node
dpkg -r nodejs-doc

sudo apt-get clean
sudo apt-get update && sudo apt-get upgrade

# add nodejs 10 ppa (personal package archive) from nodesource
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -

sudo apt-get update

# install nodejs and npm
sudo apt-get install -y nodejs
sudo apt-get install npm


node --version
npm --version


echo "
----------------------
  PM2
----------------------
"

# install pm2 with npm
sudo npm install -g pm2

# set pm2 to start automatically on system startup
sudo pm2 startup systemd


echo "
----------------------
  NGINX
----------------------
"

# install nginx
sudo apt-get install -y nginx


echo "
----------------------
  UFW (FIREWALL)
----------------------
"

# allow ssh connections through firewall
sudo ufw allow OpenSSH

# allow http & https through firewall
sudo ufw allow 'Nginx Full'

# enable firewall
sudo ufw --force enable
