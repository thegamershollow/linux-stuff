#!/bin/bash

sudo apt install build-essential

git clone https://github.com/rvaiya/keyd keyd-master

cd keyd-master

make

sudo make install

cd ../

rm -rf keyd-master

sudo curl -LOk https://raw.githubusercontent.com/thegamershollow/linux-stuff/refs/heads/main/keyd/chromebook.conf | sudo cp chromebook.conf /etc/keyd/

sudo systemctl start --now keyd

sudo keyd reload
