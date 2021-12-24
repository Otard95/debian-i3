#!/bin/bash

curl https://az764295.vo.msecnd.net/stable/899d46d82c4c95423fb7e10e68eba52050e30ba3/code_1.63.2-1639562499_amd64.deb -o ./code.deb
sudo apt install -y ./code.deb
rm code.deb

