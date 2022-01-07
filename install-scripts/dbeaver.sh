#!/bin/bash

source ./utils.sh

sub_header "Install dbeaver"

curl https://download.dbeaver.com/community/21.3.1/dbeaver-ce_21.3.1_amd64.deb -o ./dbeaver.deb
sudo apt install -y ./dbeaver.deb
rm dbeaver.deb
