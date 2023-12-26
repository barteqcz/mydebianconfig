#!/bin/bash

cd
sudo apt update
sudo apt purge ifupdown -y
sudo rm -rf /etc/network
sudo apt install build-essential network-manager-gnome pipewire pipewire-alsa pipewire-jack pipewire-pulse wireplumber nvidia-driver cinnamon bluez bluez-cups cups cups-browsed cups-bsd cups-client cups-common cups-core-drivers cups-daemon cups-filters-core-drivers cups-filters cups-ipp-utils cups-pk-helper cups-ppdc cups-server-common ghostscript hplip slick-greeter lightdm-settings htop qt5ct qt5-style-plugins sassc -y
sudo apt purge zutty lightdm-gtk-greeter yelp malcontent -y
sudo apt autoremove --purge -y
sudo su -c "sed -i 's/#greeter-hide-users=false/greeter-hide-users=false/g' /etc/lightdm/lightdm.conf"
sudo rm /etc/grub.d/05_debian_theme
sudo update-grub
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo su -c 'echo "#swapfile" >> /etc/fstab'
sudo su -c 'echo "/swapfile    none    swap    sw    0    0" >> /etc/fstab'
wget http://packages.linuxmint.com/pool/main/m/mint-themes/mint-themes_2.1.6.tar.xz
wget http://packages.linuxmint.com/pool/main/m/mint-y-icons/mint-y-icons_1.7.1.tar.xz
tar -xf mint-themes_2.1.5.tar.xz
cd mint-themes/
make clean
make
cd usr/share/themes/
sudo mv * /usr/share/themes/
cd
tar -xf mint-y-icons_1.6.7.tar.xz
cd mint-y-icons/usr/share/icons/
sudo mv * /usr/share/icons/
cd
wget https://github.com/ful1e5/Bibata_Cursor/releases/latest/download/Bibata-Modern-Ice.tar.xz
wget https://github.com/ful1e5/Bibata_Cursor/releases/latest/download/Bibata-Modern-Classic.tar.xz
tar -xf Bibata-Modern-Ice.tar.xz
sudo mv Bibata-Modern-Ice /usr/share/icons/
tar -xf Bibata-Modern-Classic.tar.xz
sudo mv Bibata-Modern-Classic /usr/share/icons/
sudo su -c 'echo "qt5ct=QT_QPA_PLATFORMTHEME" >> /etc/environment'
sudo su -c 'echo "XCURSOR_SIZE=24" >> /etc/environment'
sudo systemctl mask hibernate.target
sudo systemctl mask suspend.target
sudo su -c 'echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf'

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
