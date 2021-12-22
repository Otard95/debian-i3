#!/bin/bash

source ./utils.sh

sub-header "Enable systemd-resolved service"
sudo systemctl enable systemd-resolved

sub-header "Enable NetworkManager service"
sudo systemctl enable NetworkManager
