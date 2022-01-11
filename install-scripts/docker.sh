#!/bin/bash

source ./utils.sh

sub_header "Install docker"

docker -v &>/dev/null
if [[ $? -eq 0 ]]; then
  echo " -> Already installed"
  exit 0
fi

echo " -> Add keyring"
if [[ ! -f /usr/share/keyrings/docker-archive-keyring.gpg ]]; then
  curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
fi

echo " -> Add source list"
if [[ ! -f /etc/apt/sources.list.d/docker.list ]]; then
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
fi

echo " -> Install"
sudo apt update && sudo apt install -y docker-ce docker-ce-cli containerd.io
