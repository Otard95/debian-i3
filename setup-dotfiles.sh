#!/bin/bash

source ./utils.sh

backDir=$(pwd)

sub_header "git clone dotfiles repo"
cd ~/
git clone https://github.com/Otard95/dotfiles.git
cd ~/dotfiles

sub_header "Setup git remotes"
git remote set-url origin git@github.com:Otard95/dotfiles.git
git remote add https https://github.com/Otard95/dotfiles.git

sub_header "Dotbot install"
./install

cd $backDir
