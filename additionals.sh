#!/bin/bash

source ./utils.sh

apt_pacages=()
snap_pacages=()
snap_classic_pacages=()
script_installs=()
after_install=()

## Select installs

echo "Select apps to install"

if prompt_yes_no "Install VSCode"; then
  script_installs+=("./install-scripts/code.sh")
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

if prompt_yes_no "Install GIMP"; then
  apt_pacages+=(gimp)
fi

echo
echo "Select tools to install"

if prompt_yes_no "Install Docker"; then
  apt_pacages+=( \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
  )
  script_installs+=("./install-scripts/docker.sh")
fi

if prompt_yes_no "Install Docker Compose"; then
  script_installs+=("./install-scripts/docker-compose.sh")
fi

if prompt_yes_no "Install Ranger"; then
  apt_pacages+=(ranger)
fi

if prompt_yes_no "Install GH CLI"; then
  script_installs+=("./install-scripts/gh.sh")
fi

if prompt_yes_no "Install fzf"; then
  apt_pacages+=(fzf)
fi

if prompt_yes_no "Install thefuck"; then
  apt_pacages+=(python3-dev python3-pip python3-setuptools)
  script_installs+=("sub_header 'Install thefuck'" "pip3 install thefuck --user")
fi

echo
echo "Select other installs"

if prompt_yes_no "Install Barrier"; then
  apt_pacages+=(barrier)
fi

if prompt_yes_no "Install Appgate"; then
  script_installs+=("./install-scripts/appgate.sh")
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
