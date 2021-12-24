#!/bin/bash

echo " - Enable and restart snapd"
sudo systemctl enable snapd.service
sudo systemctl restart snapd.service
sleep 2

echo " - Install snap core"
sudo snap install core
