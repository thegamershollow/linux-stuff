#!/bin/bash/
sudo apt install tmux flatpak git curl cmake wget -y
curl http://ftp.us.debian.org/debian/pool/main/h/hyfetch/hyfetch_1.4.11-1_all.deb -o hyfetch.deb
curl http://ftp.us.debian.org/debian/pool/main/h/hyfetch/neowofetch_1.4.11-1_all.deb -o neowofetch.deb
curl https://www.synaptics.com/sites/default/files/Ubuntu/pool/stable/main/all/synaptics-repository-keyring.deb -o repo.deb
sudo apt install ./neowofetch.deb ./hyfetch.deb ./repo.deb -y && sudo apt update
sudo reboot
