#!/bin/bash

source ./utils.sh

sub_header "Install VSCode"

code -v &>/dev/null
if [[ $? -eq 0 ]]; then
  echo " -> Allready installed"
  exit 0
fi

echo " -> Get .deb"
curl https://dl.discordapp.net/apps/linux/0.0.16/discord-0.0.16.deb -o ./discord.deb

echo " -> Install"
sudo apt install -y ./discord.deb

echo " -> Cleanup"
rm discord.deb

