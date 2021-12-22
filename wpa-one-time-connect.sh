#!/bin/bash

wpa_supplicant -B -i $1 -c <(wpa_passphrase "$2" "$3")
