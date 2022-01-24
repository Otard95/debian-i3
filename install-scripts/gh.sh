#!/bin/bash

source ./utils.sh

sub_header "Install GH CLI"

gh --version &>/dev/null
if [[ $? -eq 0 ]]; then
  echo " -> Already installed"
  exit 0
fi

# curl https://github.com/cli/cli/releases/download/v2.4.0/gh_2.4.0_linux_386.deb -o ./gh.deb
echo " -> Get .deb"
curl 'https://github.com/cli/cli/releases/download/v2.4.0/gh_2.4.0_linux_amd64.deb' -L -o ./gh.deb
echo " -> Install"
sudo apt install ./gh.deb
echo " -> Cleanup"
rm ./gh.deb
