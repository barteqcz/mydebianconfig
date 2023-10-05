#!/bin/bash

sudo apt update
sudo apt purge ifupdown -y
sudo rm -rf /etc/network
sudo apt install network-manager-gnome pipewire pipewire-alsa pipewire-jack pipewire-pulse wireplumber nvidia-driver cinnamon bluez bluez-cups cups cups-browsed cups-bsd cups-client cups-common cups-core-drivers cups-daemon cups-filters-core-drivers cups-filters cups-ipp-utils cups-pk-helper cups-ppdc cups-server-common ghostscript gutenprint hplip slick-greeter lightdm-settings htop -y
sudo apt purge zutty lightdm-gtk-greeter -y
sudo sed -i '/greeter-hide-users=false/s/^/#/g' /etc/lightdm/lightdm.conf