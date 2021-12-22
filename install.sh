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
  # Fonts
  fonts-firacode \
)

sudo apt update && sudo apt upgrade -y && sudo apt install -y ${pacages[@]}

./install-brave.sh
