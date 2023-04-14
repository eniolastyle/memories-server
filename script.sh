#!/usr/bin/env bash

echo "
----------------------
  NODE & NPM
----------------------
"

sudo apt-get purge nodejs || true
sudo apt-get autoremove || true
sudo apt-get remove nodejs || true

sudo apt-get install nodejs -y
sudo apt-get install npm -y

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
