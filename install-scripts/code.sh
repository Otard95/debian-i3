#!/bin/bash

source ./utils.sh

sub_header "Install VSCode"

code -v &>/dev/null
if [[ $? -eq 0 ]]; then
  echo " -> Allready installed"
  exit 0
fi

echo " -> Get .deb"
curl https://az764295.vo.msecnd.net/stable/899d46d82c4c95423fb7e10e68eba52050e30ba3/code_1.63.2-1639562499_amd64.deb -o ./code.deb

echo " -> Install"
sudo apt install -y ./code.deb

echo " -> Cleanup"
rm code.deb

