#!/bin/bash

source ./utils.sh

sub_header "Install i3blocks"

i3blocks -h &>/dev/null
if [[ $? -eq 0 ]]; then
  echo " -> Already installed"
  exit 0
fi

back_dir=$(pwd)

echo " -> Clone"
sudo git clone https://github.com/vivien/i3blocks /usr/src/i3blocks
cd /usr/src/i3blocks

echo " -> Configure, make and install"
sudo ./autogen.sh
sudo ./configure
sudo make
sudo make install

cp $back_dir
