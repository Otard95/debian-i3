#!/bin/bash

wlanDevice=""
ssid=""
passphrase=""

usage() {
  echo "Usage: $0 -w <wlan device> -s <ssid> -p <passphrase>"
  echo "Example: $0 -w wlan0 -s \"My Wifi Network\" -p \"My Wifi Password\""
  exit 1
}

while getopts ":w:s:p:" opt; do
  case $opt in
    w)
      wlanDevice=$OPTARG
      ;;
    s)
      ssid=$OPTARG
      ;;
    p)
      passphrase=$OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      usage
      ;;
  esac
done

./wpa-one-time-connect.sh $wlanDevice "$ssid" "$passphrase"

./install.sh
./setup-network-manager.sh
./setup-lightdm

echo "Done!"
echo "Please reboot your system"
