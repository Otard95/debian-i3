#!/bin/bash

source ./utils.sh

sub_header "Install NordVPN"

nordvpn -h &>/dev/null
if [[ $? -eq 0 ]]; then
  echo " -> Allready installed"
  exit 0
fi

echo " -> Get .deb"
curl https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb -o ./nordvpn.deb

echo " -> Install"
sudo apt install -y ./nordvpn.deb

echo " -> Cleanup"
rm nordvpn.deb

