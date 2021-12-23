#!/bin/bash

pacages=( \
  # Core
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
  xclip \
  # Fonts
  fonts-firacode \
)
after_install=()

source ./utils.sh

read -p "Setup snap? (Y/n): " answer
if [[ -z "$answer" ]] || [[ $answer =~ ^[Nn]o?$ ]]; then
  pacages+=("snapd")
  after_install+=("./setup-snap.sh")
fi

sub_header "Install packages"
sudo apt update && sudo apt upgrade -y && sudo apt install -y ${pacages[@]}

if [[ ${#after_install[@]} -gt 0 ]]; then
  sub_header "Post install"
  for action in "${after_install[@]}"; do
    eval "$action"
  done
fi
