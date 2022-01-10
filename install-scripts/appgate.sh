#!/bin/bash

source ./utils.sh

sub_header "Install AppGate"

sudo appgate_service_configurator -h &>/dev/null
if [[ $? -eq 0 ]]; then
  echo " -> Already installed"
  exit 0
fi

if ! grep -s -q 'buster/updates' /etc/apt/sources.list; then
  echo " -> Add source"
  sudo cp /etc/apt/sources.list /etc/apt/sources.list.$(date +%s).BAK
  echo -e "\ndeb http://security.debian.org/debian-security buster/updates main" | sudo tee -a /etc/apt/sources.list
  sudo apt update
fi

echo " -> Get .deb"
curl https://bin.appgate-sdp.com/5.1/client/appgate-sdp-headless_5.1.2_amd64.deb -o ./appgade.deb

echo " -> Install"
sudo dpkg -i --ignore-depends=libappindicator1 ./appgate-sdp_5.1.2_amd64.deb
sudo apt update
sudo apt --fix-broken install

echo " -> Cleanup"
rm appgade.deb
