#!/bin/bash

if [[ ! -f /usr/share/keyrings/githubcli-archive-keyring.gpg ]]; then
  curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
fi

if [[ ! -f /etc/apt/sources.list.d/github-cli.list ]]; then
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
fi

sudo apt update && sudo apt install -y gh
