#!/bin/bash

if [[ ! -f /usr/share/keyrings/docker-archive-keyring.gpg ]]; then
  curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
fi

if [[ ! -f /etc/apt/sources.list.d/docker.list ]]; then
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
fi

sudo apt update && sudo apt install -y docker-ce docker-ce-cli containerd.io

