#!/bin/bash

source ./utils.sh

sub_header "Enable and restart snapd"
sudo systemctl enable snapd.service
sudo systemctl restart snapd.service
sleep 2

sub_header  "Install snap core"
sudo snap install core
