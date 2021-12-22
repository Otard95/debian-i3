#!/bin/bash

source ./utils.sh

sub-header "Enable systemd-resolved service"
sudo systemctl enable systemd-resolved
sudo systemctl restart systemd-resolved

sub-header "Enable NetworkManager service"
sudo systemctl enable NetworkManager
sudo systemctl restart  NetworkManager

sub-header "Wait for NetworkManager to restart..."
sleep 5
sub-header "Connecting to your wifi network..."
nmcli device wifi connect "$1" password "$2"
sleep 1