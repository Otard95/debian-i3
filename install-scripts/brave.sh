#!/bin/bash

source ./utils.sh

sub_header "Install brave"

brave-browser --version &>/dev/null
if [[ $? -eq 0 ]]; then
  echo " -> Already installed"
  exit 0
fi

echo " -> Add keyring"
if [[ ! -f /usr/share/keyrings/brave-browser-archive-keyring.gpg ]]; then
  sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
fi

echo " -> Add source list"
if [[ ! -f /etc/apt/sources.list.d/brave-browser-release.list ]]; then
  echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
fi

echo " -> Install"
sudo apt update && sudo apt install -y brave-browser
