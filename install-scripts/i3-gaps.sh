#!/bin/bash

sudo curl -L https://github.com/barnumbirr/i3-gaps-debian/releases/download/v4.20.1-1/i3-gaps_4.20.1-1_amd64_bullseye.deb -o ./i3-gaps.deb
sudo apt install ./i3-gaps.deb
sudo rm ./i3-gaps.deb
