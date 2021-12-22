#!/bin/bash

ssid=""
passphrase=""

usage() {
  echo "Usage: $0 -s <ssid> -p <passphrase>"
  echo "Example: $0 -s \"My Wifi Network\" -p \"My Wifi Password\""
  exit 1
}

while getopts ":w:s:p:" opt; do
  case $opt in
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

if [[ -z $ssid ]] || [[ -z $passphrase ]]; then
  usage
fi

source ./utils.sh

header "Connecting to your wifi network..."
./network-manager-connect.sh "$ssid" "$passphrase"

header "Setup snap"
./setup-snap.sh

header "Setup dotfiles"
./setup-dotfiles.sh

header "Setup lightdm"
./setup-lightdm.sh

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
