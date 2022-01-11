#!/bin/bash

source ./utils.sh

sub_header "Install AppGate"

sudo appgate_service_configurator -h &>/dev/null
if [[ $? -eq 0 ]]; then
  echo " -> Already installed"
  exit 0
fi

if ! grep -s -q 'buster' /etc/apt/sources.list; then
  echo " -> Add source"
  sudo cp /etc/apt/sources.list /etc/apt/sources.list.$(date +%s).BAK
  
  echo "
## Some required packeages for appgate is in the buster (debian 10) sources.
deb http://deb.debian.org/debian buster main contrib non-free
deb-src http://deb.debian.org/debian buster main contrib non-free
" | sudo tee -a /etc/apt/sources.list

  sudo apt update
fi

echo " -> Get .deb"
# curl https://bin.appgate-sdp.com/5.1/client/appgate-sdp-headless_5.1.2_amd64.deb -o ./appgade.deb
curl https://bin.appgate-sdp.com/5.1/client/appgate-sdp_5.1.2_amd64.deb -o ./appgade.deb

echo " -> Install"
# sudo dpkg -i --ignore-depends=libappindicator1 ./appgade.deb
sudo apt install ./appgade.deb

echo " -> Cleanup"
rm appgade.deb
