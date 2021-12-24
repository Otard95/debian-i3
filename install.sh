#!/bin/bash

packages=( \
  # Core
  apt-transport-https \
  xorg \
  i3 \
  i3blocks \
  i3lock-fancy \
  i3status \
  lightdm \
  picom \
  nitrogen \
  # Terminal
  kitty \
  neofetch \
  # Tools
  curl \
  vim \
  git \
  xclip \
  # Fonts
  fonts-firacode \
)
after_install=()
dry_run=0

for arg in $@; do
  if [[ $arg == "--dry" ]]; then
    dry_run=1
  fi
done

source ./utils.sh

read -p "Setup snap? (Y/n): " answer
if [[ -z "$answer" ]] || [[ $answer =~ ^[Yy](es)?$ ]]; then
  packages+=("snapd")
  after_install+=("./setup-snap.sh")
fi

if [[ $dry_run -ne 0 ]]; then
  echo "Packages: ${packages[@]}"
  echo "After Install: ${after_install[@]}"
else
  sub_header "Install packages"
  sudo apt update && sudo apt upgrade -y && sudo apt install -y ${packages[@]}
fi

if [[ ${#after_install[@]} -gt 0 ]]; then
  sub_header "Post install"
  for action in "${after_install[@]}"; do
    if [[ $dry_run -ne 0 ]]; then
      echo "Post install run: $action"
    else
      eval "$action"
    fi
  done
fi
