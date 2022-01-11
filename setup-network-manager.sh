#!/bin/bash

source ./utils.sh

sub_header "Enable systemd-resolved service"
sudo systemctl enable systemd-resolved

sub_header "Enable NetworkManager service"
sudo systemctl enable NetworkManager
sleep 2

sub_header "Connect you your network"
nmcli device wifi connect "$1" password "$2"
sleep 1
nmcli d modify "$3" ipv4.dns "192.168.1.1,1.0.0.1,1.1.1.1"
sleep 1
