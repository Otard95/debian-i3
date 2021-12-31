#!/bin/bash

source ./utils.sh

sub_header "Install i3blocks"

back_dir=$(pwd)

sudo git clone https://github.com/vivien/i3blocks /usr/src/i3blocks
cd /usr/src/i3blocks
sudo ./autogen.sh
sudo ./configure
sudo make
sudo make install

cp $back_dir
