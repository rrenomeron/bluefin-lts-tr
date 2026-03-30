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
