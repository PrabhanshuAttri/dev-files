#!/bin/bash

cd ~/Downloads

function showStatus() {
	printf "\n${1}\n"
}

function install() {
  sudo apt-get install -y "$@"
}

echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
sudo apt-get install ttf-mscorefonts-installer -y

showStatus "Installing Update and Upgrade"
sudo apt-get install ubuntu-restricted-extras software-properties-common -y && sudo apt-get update -y && sudo apt-get dist-upgrade -y && sudo apt-get autoremove -y

showStatus "Installing dependencies"
sudo apt-get install apt-transport-https -y

showStatus "Installing flush dns tool nscd"
sudo apt-get install nscd -y
sudo /etc/init.d/nscd restart

showStatus "Installing Cowsay and Fortune"
sudo apt-get install cowsay fortune-mod -y

showStatus "Installing Gdebi"
sudo apt-get install gdebi -y

showStatus "Installing vim, tmux, zsh, htop and tree"
sudo apt-get install vim vim-nox zsh tmux htop tree -y

showStatus "Installing git"
sudo apt-get install git -y

showStatus "Installing Chrome Gnome Shell"
sudo apt-get install chrome-gnome-shell -y

showStatus "Installing Curl"
sudo apt-get install curl -y

showStatus "Removing Bloatware"
sudo apt-get remove account-plugin-aim account-plugin-google account-plugin-facebook account-plugin-flickr account-plugin-jabber account-plugin-salut account-plugin-twitter account-plugin-windows-live account-plugin-yahoo aisleriot brltty colord deja-dup deja-dup-backend-gvfs duplicity empathy empathy-common evolution-data-server-online-accounts example-content gnome-accessibility-themes gnome-contacts gnome-mahjongg gnome-mines gnome-orca gnome-sudoku gnome-video-effects gnomine landscape-common libsane libsane-common mcp-account-manager-uoa python3-uno rhythmbox rhythmbox-plugins rhythmbox-plugin-zeitgeist sane-utils shotwell shotwell-common telepathy-gabble telepathy-haze telepathy-idle telepathy-indicator telepathy-logger telepathy-mission-control-5 telepathy-salut thunderbird thunderbird-gnome-support totem totem-common totem-plugins unity-scope-audacious unity-scope-chromiumbookmarks unity-scope-clementine unity-scope-colourlovers unity-scope-devhelp unity-scope-gdrive unity-scope-gmusicbrowser unity-scope-gourmet unity-scope-manpages unity-scope-musicstores unity-scope-musique unity-scope-openclipart unity-scope-texdoc unity-scope-tomboy unity-scope-video-remote unity-scope-virtualbox unity-scope-yelp unity-scope-zotero -y

showStatus "Installing tweak"
sudo apt-get install gnome-tweak-tool -y

showStatus "Installing pomodo"
sudo apt-get install gnome-shell-pomodoro -y

showStatus "Installing VSCodium"
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo apt-key add -
echo 'deb https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list.d/vscodium.list
sudo apt update && sudo apt install codium

showStatus "Removing guest account"
sudo sh -c 'showStatus "[Seat:*]\nallow-guest=false\n" >/etc/lightdm/lightdm.conf.d/50--guest.conf'

showStatus "Setting vim as default editor"
sudo update-alternatives --set editor /usr/bin/vim.basic
showStatus "Remove duplicate sources"
sudo apt-get install python3-apt python3-regex -y
curl -LO https://github.com/davidfoerster/aptsources-cleanup/releases/download/v0.1.6.3/aptsources-cleanup.zip
sudo python3 -OEs aptsources-cleanup.zip

showStatus "Update everything"
sudo apt-get install ubuntu-restricted-extras -y && sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt-get autoremove -y
