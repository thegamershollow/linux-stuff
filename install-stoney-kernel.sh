#!/bin/bash

# install curl and git
sudo apt install curl git -y

# Download the kernel image
curl -LOk https://fs.nightcore.monster/chromebook/stoney/kernel/latest.tar.xz

# untar the archive
tar xf latest.tar.xz

# copy the files into the right places

sudo cp stoney/vmlinuz-6.6.16-stoney /boot
sudo cp stoney/System.map-6.6.16-stoney /boot
sudo cp stoney/config /boot/config-6.6.16-stoney
sudo cp -r stoney/headers /usr/src/linux-headers-6.6.16-stoney
sudo cp -r stoney/modules/lib/modules/6.6.16-stoney /lib/modules/6.6.16-stoney

# create initramfs image
sudo update-initramfs -c -k 6.6.16-stoney

# remove old vmlinuz
sudo rm /vmlinuz
sudo rm /vmlinuz.old

# remove old initrd image
sudo rm /initrd.img
sudo rm /initrd.img.old

# create new vmlinuz and vmlinuz.old files
sudo ln -s /boot/vmlinuz-6.6.16-stoney /vmlinuz
sudo ln -s /boot/vmlinuz-6.6.16-stoney /vmlinuz.old

# create new initrd.img and initrd.img.old files
sudo ln -s /boot/initrd.img-6.6.16-stoney /initrd.img
sudo ln -s /boot/initrd.img-6.6.16-stoney /initrd.img.old

# update grub config
sudo update-grub