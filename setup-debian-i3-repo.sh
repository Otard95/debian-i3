#!/bin/bash

source ./utils.sh

backDir=$(pwd)

sub_header "git clone debian-i3 repo"
cd ~/
git clone https://github.com/Otard95/debian-i3.git
cd ~/debian-i3

sub_header "Setup git remotes"
git remote set-url origin git@github.com:Otard95/debian-i3.git
git remote add https https://github.com/Otard95/debian-i3.git

cd $backDir
