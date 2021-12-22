#!/bin/bash

sudo bash -c "wpa_supplicant -B -i $1 -c <(wpa_passphrase '$2' '$3') && dhclient $1"
