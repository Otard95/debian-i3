#!/bin/bash

source ./utils.sh

sub_header "Install GH CLI"

gh --version &>/dev/null
if [[ $? -eq 0 ]]; then
  echo " -> Already installed"
  exit 0
fi

# curl https://github.com/cli/cli/releases/download/v2.4.0/gh_2.4.0_linux_386.deb -o ./gh.deb
echo " -> Get .deb"
curl 'https://objects.githubusercontent.com/github-production-release-asset-2e65be/212613049/938d16f0-e380-4a84-ba50-ffb7b73d16c1?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20220107%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20220107T091752Z&X-Amz-Expires=300&X-Amz-Signature=2f7dca15d59ca4253e7a3b4c71bab4a230a11b1b382d65ef489a9a6067463333&X-Amz-SignedHeaders=host&actor_id=0&key_id=0&repo_id=212613049&response-content-disposition=attachment%3B%20filename%3Dgh_2.4.0_linux_amd64.deb&response-content-type=application%2Foctet-stream' -o ./gh.deb
echo " -> Install"
sudo apt install ./gh.deb
echo " -> Cleanup"
rm ./gh.deb
