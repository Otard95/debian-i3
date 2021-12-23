#!/bin/bash

source ./utils.sh

apt_pacages=()
snap_pacages=()
snap_classic_pacages=()
script_installs=()
after_install=()

## Select installs

if prompt_yes_no "Install NordPass"; then
  apt_pacages+=( \
    gnome-keyring \
    libsecret-1-dev \
  )
  snap_pacages+=(nordpass)
fi

if prompt_yes_no "Install NordVPN"; then
  apt_pacages+=("./packages/nordvpn.deb")
fi

if prompt_yes_no "Install VSCode"; then
  apt_pacages+=(code)
fi

if prompt_yes_no "Install Brave"; then
  script_installs+=("./install-scripts/brave.sh")
fi

if prompt_yes_no "Install Postman"; then
  script_installs+=("./install-scripts/postman.sh")
fi

if prompt_yes_no "Install DBeaver"; then
  script_installs+=("./install-scripts/dbeaver.sh")
fi

if prompt_yes_no "Install Discord"; then
  snap_pacages+=(discord)
fi

if prompt_yes_no "Install Slack"; then
  snap_classic_pacages+=(slack)
fi

if prompt_yes_no "Install Docker"; then
  apt_pacages+=( \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
  )
  script_installs+=("./install-scripts/docker.sh")
fi

if prompt_yes_no "Install Ranger"; then
  apt_pacages+=(ranger)
fi

if prompt_yes_no "Install GH CLI"; then
  script_installs+=("./install-scripts/gh.sh")
fi

## Install selected

if [[ ${#apt_pacages[@]} -gt 0 ]]; then
  sub_header "APT install"
  sudo apt install -y "${apt_pacages[@]}"
fi

if [[ ${#snap_pacages[@]} -gt 0 ]]; then
  sub_header "SNAP install"
  sudo snap install "${snap_pacages[@]}";
fi

if [[ ${#snap_classic_pacages[@]} -gt 0 ]]; then
  sub_header "SNAP install --classic"
  sudo snap install --classic "${snap_classic_pacages[@]}"
fi

if [[ ${#script_installs[@]} -gt 0 ]]; then
  sub_header "SCRIPT install"
  for script in "${script_installs[@]}"; do
    eval "$script"
  done
fi

echo ""
echo "Done!"
