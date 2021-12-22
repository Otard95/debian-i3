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

./wpa-one-time-connect.sh $wlanDevice "$ssid" "$passphrase"

./install-network-manager.sh
./setup-network-manager.sh "$ssid" "$passphrase"

./install.sh
./setup-lightdm.sh

git -C ~/ clone https://github.com/Otard95/dotfiles.git
cd ~/dotfiles
./install

echo ""
echo "Done!"
echo "Please reboot your system"
