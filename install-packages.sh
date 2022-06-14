#!/bin/sh


url1="https://raw.githubusercontent.com/pixthehe/MyArchBackup/main/packages.txt"
url2="https://raw.githubusercontent.com/pixthehe/MyArchBackup/main/aur-packages.txt"
echo "Downloading package list"
cd ~ && mkdir temp && cd temp
sudo pacman -S --noconfirm wget git base-devel
wget $url1
#pacman -Qqen > pkglist.txt
sudo pacman -S --needed $(comm -12 <(pacman -Slq | sort) <(sort pkglist.txt))
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si && cd ..
wget $url2
#pacman -Qqem > aur-packages.txt
yay -S --noconfirm - < aur-packages.txt
cd ..
rm -rf temp
