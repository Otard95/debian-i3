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

if [[ -z $wlanDevice ]] || [[ -z $ssid ]] || [[ -z $passphrase ]]; then
  usage
fi

source ./utils.sh

header "Initial internet connection with wpa_supplicant"
./wpa-one-time-connect.sh $wlanDevice "$ssid" "$passphrase"

header "Install NetworkManager"
sudo apt install -y network-manager

header "Setup NetworkManager and add your network"
./setup-network-manager.sh "$ssid" "$passphrase"

echo ""
echo "Done!"

while true; do
  read -p "Reboot now? (y/n) " answer
  case $answer in
    [Yy] )   sudo systemctl reboot; break;;
    [Yy]es ) sudo systemctl reboot; break;;
    [Nn] )   break;;
    [Nn]o )  break;;
    * ) echo "Please answer yes or no.";;
  esac
done
