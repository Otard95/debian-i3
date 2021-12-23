#!/bin/bash

source ./utils.sh

if [[ ! -f /usr/share/keyrings/brave-browser-archive-keyring.gpg ]]; then
  sub_header "Add keyring"
  sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
fi

if [[ ! -f /etc/apt/sources.list.d/brave-browser-release.list ]]; then
  sub_header "Add repository"
  echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
fi

sub_header "Install brave"
sudo apt update && sudo apt install -y brave-browser
