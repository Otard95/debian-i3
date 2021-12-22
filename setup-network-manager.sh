#!/bin/bash

sudo systemctl enable systemd-resolved
sudo systemctl restart systemd-resolved
sudo systemctl enable NetworkManager
sudo systemctl restart  NetworkManager

echo "Wait for NetworkManager to restart..."
sleep 5
echo "Connecting to your wifi network..."
nmcli device wifi connect "$1" password "$2"
