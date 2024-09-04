#!/bin/bash

# Update and upgrade system packages
sudo apt update && sudo apt upgrade -y

# Install basic utilities
sudo apt install -y curl wget git vim nano build-essential

# Install preload
sudo apt install -y preload

# Install Visual Studio Code
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install -y code

# Install Docker
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install -y docker-ce
sudo usermod -aG docker ${USER}

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep -Po '"tag_name": "\K.*?(?=")')/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Install KVM, QEMU, and Virt-Manager
sudo apt install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager
sudo systemctl enable libvirtd
sudo systemctl start libvirtd

# Install Python3, pip, venv
sudo apt install -y python3 python3-pip python3-venv

# Install Stacer
sudo add-apt-repository -y ppa:oguzhaninan/stacer
sudo apt update
sudo apt install -y stacer

# Install Telegram
sudo snap install telegram-desktop

# Install Discord
sudo snap install discord

# Install Reddit (via Electron app)
sudo snap install reddit-app

# Install Spotube
sudo snap install spotube

# Install App Launcher
sudo apt install -y rofi

# Install Fish Shell and configure
sudo apt install -y fish

# Install VLC
sudo apt install -y vlc

# Install htop
sudo apt install -y htop

# Install nala (replacement of apt)
sudo apt install nala

# Install timeshift (for the backup of the ubuntu system)
sudo apt install timeshift

sudo apt install gnome-shell-extension-manager

# Install and configure GNOME extensions (ddterm, etc.)
sudo apt install -y gnome-shell-extension-ddterm
gnome-shell-extension-tool -e ddterm@amezin.github.com

# Install GIMP
sudo apt install -y gimp

# Install VirtualBox
sudo apt install -y virtualbox

# Install tgpt
curl -sSL https://raw.githubusercontent.com/aandrew-me/tgpt/main/install | bash -s /usr/local/bin

# Install Chrome GNOME Shell
sudo apt install -y chrome-gnome-shell

# Install GNOME Shell Extension Manager
sudo apt install -y gnome-shell-extension-manager

# Install GNOME Sushi
sudo apt install -y gnome-sushi

# Pull and run Jellyfin container
sudo docker pull jellyfin/jellyfin
sudo docker run -d --name=jellyfin -p 8096:8096 -v jellyfin_config:/config -v jellyfin_cache:/cache -v /path/to/media:/media jellyfin/jellyfin

# Pull and run Droppy container
sudo docker pull silverwind/droppy
sudo docker run -d --name=droppy -p 8989:8989 -v /path/to/files:/files -v /path/to/config:/config silverwind/droppy

# Pull and run Portainer container
sudo docker pull portainer/portainer-ce
sudo docker run -d --name=portainer -p 9000:9000 --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce

# Pull and run Jenkins container
sudo docker pull jenkins/jenkins:lts
sudo docker run -d --name=jenkins -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts

# Clean up
sudo apt autoremove -y

echo "Installation of all necessary software is complete. Please restart your system to apply all changes.

"
