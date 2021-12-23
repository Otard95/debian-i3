#!/bin/bash

curl https://dl.discordapp.net/apps/linux/0.0.16/discord-0.0.16.deb -o ./discord.deb
sudo apt install ./discord.deb
rm discord.deb

