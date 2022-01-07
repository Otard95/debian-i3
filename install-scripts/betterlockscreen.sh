#!/bin/bash

source ./utils.sh

sub_header "Install Betterlockscreen"

betterlockscreen -v &>/dev/null
if [[ $? -eq 0 ]]; then
  echo " -> Allready installed"
  exit 0
fi

back_dir=$(pwd)

echo " -> Install i3lock-color"
sudo git clone https://github.com/Raymo111/i3lock-color.git /usr/src/i3lock-color
cd /usr/src/i3lock-color
sudo ./install-i3lock-color.sh

cd $back_dir

echo " -> Install betterlockscreen"
sudo curl https://git.io/JZyxV -Lo ./betterlockscreen-install.sh
sudo chmod +x ./betterlockscreen-install.sh
sudo ./betterlockscreen-install.sh system v4.0.3

echo " -> Cleanup"
sudo rm ./betterlockscreen-install.sh
