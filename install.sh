#!/bin/bash

pacages=( \
  # Core
  network-manager \
  xorg \
  i3 \
  i3blocks \
  i3lock-fancy \
  i3status \
  lightdm \
  # Terminal
  kitty \
  neofetch \
  # Tools
  apt-transport-https \
  curl \
  vim \
  git \
  # Fonts
  fonts-firacode \
  # Snap
  snapd \
)

source ./utils.sh

sub-header "Install packages"
sudo apt update && sudo apt upgrade -y && sudo apt install -y ${pacages[@]}

sub-header "Setup snap"
sudo snap install core

sub-header "Install NordPass"
sudo snap install nordpass
