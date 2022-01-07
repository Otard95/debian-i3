#!/bin/bash

source ./utils.sh

sub_header "Install VSCode"

if [[ -d /usr/src/Postman ]]; then
  echo " -> Allready installed"
  exit 0
fi

echo " -> Download latest"
curl https://dl.pstmn.io/download/latest/linux64 -o ./postman.tar.gz

echo " -> Unpack and link"
tar xf ./postman.tar.gz --directory=./
sudo mv Postman /usr/src
sudo ln -s -T /usr/src/Postman/Postman /usr/bin/postman

echo " -> Cleanup"
rm ./postman.tar.gz
