#!/usr/bin/env bash

echo "
----------------------
  NODE & NPM
----------------------
"

sudo apt-get update
sudo apt remove nodejs
sudo apt install curl

# add nodejs 10 ppa (personal package archive) from nodesource
# curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -

# install nodejs and npm
sudo apt-get install -y nodejs
# sudo apt install npm -y



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