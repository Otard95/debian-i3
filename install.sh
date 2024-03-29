#!/bin/bash

packages=( \
  # Core
  apt-transport-https \
  libcairo2-dev \
  libfontconfig1-dev \
  libxcb-composite0-dev \
  libev-dev \
  libx11-xcb-dev \
  libxcb-xkb-dev \
  libxcb-xinerama0-dev \
  libxcb-randr0-dev \
  libxcb-image0-dev \
  libxcb-util0-dev \
  libxcb-xrm-dev \
  libxcb-xtest0-dev \
  libxkbcommon-dev \
  libxkbcommon-x11-dev \
  libjpeg-dev \
  # xdorg, i3, lightdm etc.
  xorg \
  i3 \
  lightdm \
  ukui-greeter \
  picom \
  nitrogen \
  libpam0g-dev \
  bc \
  imagemagick \
  rofi \
  # Terminal
  kitty \
  neofetch \
  # Tools
  make \
  autoconf \
  pkg-config \
  gcc \
  build-essential \
  acpi \
  curl \
  neovim \
  tmux \
  git \
  git-delta \
  ripgrep \
  tig \
  xclip \
  xrandr \
  arandr \
  pmount \
  pulseaudio \
  pulseaudio-module-bluetooth \
  pavucontrol \
  ufw \
  ripgrep \
  flameshot \
  ranger \ 
  btop \ 
  # Fonts
  fonts-firacode \
  fonts-font-awesome \
  fontconfig \
)
after_install=("./install-scripts/i3blocks.sh" "./install-scripts/betterlockscreen.sh")
dry_run=0

for arg in $@; do
  if [[ $arg == "--dry" ]]; then
    dry_run=1
  fi
done

source ./utils.sh

if prompt_yes_no "Setup snap"; then
  packages+=("snapd")
  after_install+=("./setup-snap.sh")
fi

if [[ $dry_run -ne 0 ]]; then
  echo "Packages: ${packages[@]}"
  echo "After Install: ${after_install[@]}"
else
  sub_header "Install packages"
  if nala --version &> /dev/null; then
    sudo nala install -y ${packages[@]}
  else
    sudo apt install -y ${packages[@]}
  fi
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
