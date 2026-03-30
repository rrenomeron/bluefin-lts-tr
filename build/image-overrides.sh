#!/usr/bin/bash

set -eoux pipefail

# Use this for build steps that are unique to this particular image

echo "Install Bluefin packages missing from LTS"
dnf install -y \
    clinfo \
    nss-tools \
    netcat \
    virt-manager \
    virt-viewer \
    virt-v2v

echo "Disabling unneeded/unwanted systemd units"
systemctl disable tailscaled
systemctl disable docker.socket
systemctl disable docker.service

echo "Enabling Flatpak Preinstall"
systemctl enable flatpak-preinstall.service

echo "Installing GNOME Wallpaper"
curl https://gitlab.gnome.org/GNOME/gnome-backgrounds/-/archive/50.0/gnome-backgrounds-50.0.zip \
    > /tmp/gnome-backgrounds-50.0.zip
cd /tmp
unzip gnome-backgrounds-50.0.zip

mkdir /usr/share/backgrounds/gnome
cd gnome-backgrounds-50.0/backgrounds
cp *.jxl *.png *.svg /usr/share/backgrounds/gnome