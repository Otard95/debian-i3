#!/bin/bash

source ./utils.sh

nmcli device wifi connect "$1" password "$2"
sleep 1
