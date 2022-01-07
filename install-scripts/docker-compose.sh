#!/bin/bash

source ./utils.sh

sub_header "Install brave"

docker-compose -v &>/dev/null
if [[ $? -eq 0 ]]; then
  echo " -> Already installed"
  exit 0
fi

echo " -> Download binary"
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

echo " -> Make executable"
sudo chmod +x /usr/local/bin/docker-compose
