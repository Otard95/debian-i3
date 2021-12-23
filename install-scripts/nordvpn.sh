#!/bin/bash

curl https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb -o ./nordvpn.deb
sudo apt install ./nordvpn.deb
rm nordvpn.deb

