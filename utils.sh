#!/bin/bash

header() {
  echo ""
  echo "###############################################################################"
  echo "# $1"
  echo "###############################################################################"
  echo ""
}
export -f header

sub_header() {
  echo " =====>> $1"
}
export -f sub_header

prompt_yes_no() {
  while true; do
    read -p "$1? (y/n) " answer
    case $answer in
      [Yy] )   return 0; break;;
      [Yy]es ) return 0; break;;
      [Nn] )   return 1; break;;
      [Nn]o )  return 1; break;;
      * ) echo "Please answer yes or no.";;
    esac
  done
}
export -f prompt_yes_no
