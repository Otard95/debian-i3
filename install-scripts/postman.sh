#!/bin/bash

if [[ ! -d /usr/src/Postman ]]; then
  curl https://dl.pstmn.io/download/latest/linux64 -o ./postman.tar.gz
  tar xf ./postman.tar.gz --directory=./
  sudo mv Postman /usr/src
  sudo ln -s -T /usr/src/Postman/Postman /usr/bin/postman
  rm ./postman.tar.gz
fi
