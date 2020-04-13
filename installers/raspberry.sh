#!/bin/bash

cd ~/Downloads

function showStatus() {
	showStatus "${1}\n"
}

showStatus "Running RaspberryPi setup"

showStatus "Purging unnecessary packages"
sudo apt-get remove --purge -y scratch2 minecraft-pi wolfram-engine sonic-pi dillo libreoffice libreoffice-avmedia-backend-gstreamer libreoffice-base libreoffice-base-core libreoffice-base-drivers libreoffice-calc libreoffice-common libreoffice-core libreoffice-draw libreoffice-gtk2 libreoffice-impress libreoffice-java-common libreoffice-math libreoffice-pi libreoffice-report-builder-bin libreoffice-sdbc-hsqldb libreoffice-writer squeak-vm squeak-plugins-scratch geany bluej scratch3 greenfoot-unbundled python-games

showStatus "Update Raspberry Pi"
sudo apt-get update -y && sudo apt-get full-upgrade -y && sudo apt-get clean -y && sudo apt-get autoremove -y

showStatus "Installing essential tools"
sudo apt-get install nscd -y
sudo apt-get install cowsay fortune-mod -y
sudo apt-get install vim vim-nox -y
sudo apt-get install curl wget -y
sudo apt-get install youtube-dl -y
sudo apt-get install git htop zsh -y
sudo apt-get install screen -y


chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "fortune | cowsay -f tux" >> ~/.zshrc
source ~/.zshrc
