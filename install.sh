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
  # Fonts
  fonts-firacode \
)

sudo apt update && sudo apt upgrade -y && sudo apt install -y ${pacages[@]}
