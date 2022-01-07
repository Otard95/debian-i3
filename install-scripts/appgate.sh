#!/bin/bash

sudo echo "deb http://security.debian.org/debian-security buster/updates main" >> /etc/apt/sources.list
curl https://bin.appgate-sdp.com/5.1/client/appgate-sdp_5.1.2_amd64.deb -o ./appgade.deb
# curl https://bin.appgate-sdp.com/5.1/client/appgate-sdp-headless_5.1.2_amd64.deb -o ./appgade.deb
sudo apt install -y -f ./appgade.deb
rm appgade.deb
