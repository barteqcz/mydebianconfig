#!/bin/bash

sudo apt update
sudo apt purge ifupdown -y
sudo rm -rf /etc/network
sudo apt install network-manager-gnome pipewire pipewire-alsa pipewire-jack pipewire-pulse wireplumber nvidia-driver cinnamon bluez bluez-cups cups cups-browsed cups-bsd cups-client cups-common cups-core-drivers cups-daemon cups-filters-core-drivers cups-filters cups-ipp-utils cups-pk-helper cups-ppdc cups-server-common ghostscript hplip slick-greeter lightdm-settings htop -y
sudo apt purge zutty lightdm-gtk-greeter yelp malcontent -y
sudo apt autoremove --purge -y
sudo sed -i '/greeter-hide-users=false/s/^/#/g' /etc/lightdm/lightdm.conf
sudo rm /etc/grub.d/05_debian_theme
sudo update-grub
while true; do
    read -rp "Done. Reboot? [Y/n] " response
    if [[ $response == "y" || $response == "Y" || $response == "" ]]; then
        sudo reboot
    elif [[ $response == "n" || $response == "N" ]]; then
        break
    else
        echo "Invalid option."
    fi
done
