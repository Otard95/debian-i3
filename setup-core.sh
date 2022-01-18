#!/bin/bash

source ./utils.sh

header "Install packages"
./install.sh

header "Setup dotfiles"
./setup-dotfiles.sh

header "Setup debian-i3 repo"
./setup-debian-i3-repo.sh

header "Setup lightdm"
./setup-lightdm.sh

if prompt_yes_no "Install bootloader theme"; then
  git clone https://github.com/ChrisTitusTech/Top-5-Bootloader-Themes
  cd Top-5-Bootloader-Themes
  sudo ./install.sh
fi

echo ""
echo "Done!"

while true; do
  read -p "Reboot now? (y/n) " answer
  case $answer in
    [Yy] )   sudo systemctl reboot; break;;
    [Yy]es ) sudo systemctl reboot; break;;
    [Nn] )   break;;
    [Nn]o )  break;;
    * ) echo "Please answer yes or no.";;
  esac
done
