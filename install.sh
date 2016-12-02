#!/bin/bash

apt-get update
apt-get install nodejs npm
npm install
chmod +x ipMap.sh
echo -e "\nalias whereami='sudo ./~/ipMap/ipMap.sh'" >> .bash_aliases
