#!/bin/bash

source ./utils.sh

sub_header "Install Betterlockscreen"

back_dir=$(pwd)

sudo git clone https://github.com/Raymo111/i3lock-color.git /usr/src/i3lock-color
cd /usr/src/i3lock-color
sudo ./install-i3lock-color.sh

cd $back_dir

curl https://git.io/JZyxV -Lo ./betterlockscreen-install.sh
sudo chmod +x ./betterlockscreen-install.sh
sudo ./betterlockscreen-install.sh system v4.0.3
rm ./betterlockscreen-install.sh
