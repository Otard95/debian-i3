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
  vim \
  git \
  python3-dev \
  python3-pip \
  python3-setuptools \
  # Fonts
  fonts-firacode \
)

sudo apt update && sudo apt upgrade -y && sudo apt install -y ${pacages[@]}

pip3 install --user thefuck
