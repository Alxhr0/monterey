#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

wget https://copr.fedorainfracloud.org/coprs/solopasha/hyprland/repo/fedora-40/solopasha-hyprland-fedora-40.repo -O /etc/yum.repos.d/solopasha-hyprland-fedora-40.repo

# this installs a package from fedora repos
rpm-ostree install hyprland waybar thunar thunar-archive-plugin thunar-volman swww kitty brightnessctl sddm xdg-desktop-portal-hyprland neovim htop rofi-wayland NetworkManager-wifi NetworkManager linux-firmware fastfetch flatpak pipewire wireplumber pipewire-pulseaudio pavucontrol 

# this would install a package from rpmfusion
# rpm-ostree install vlc

#### Example for enabling a System Unit File

systemctl enable podman.socket sddm.service NetworkManager
