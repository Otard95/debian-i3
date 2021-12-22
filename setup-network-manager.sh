#!/bin/bash

sudo systemctl enable systemd-resolved
sudo systemctl restart systemd-resolved
sudo systemctl enable NetworkManager
sudo systemctl restart  NetworkManager

nmcli device wifi list 
echo ""
echo "Use the following command to connect to your wifi network"
echo "nmcli device wifi connect <network name> password <password>"
