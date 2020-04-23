#!/bin/bash

cd ~/Downloads

function showStatus() {
	printf "\n${1}\n"
}

echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
sudo apt-get install ttf-mscorefonts-installer

showStatus "Installing Update and Upgrade"
sudo apt-get install ubuntu-restricted-extras software-properties-common -y && sudo apt-get update -y && sudo apt-get dist-upgrade -y && sudo apt-get autoremove -y

showStatus "Adding NVIDIA package repositories"
wget -nc https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-repo-ubuntu1804_10.1.243-1_amd64.deb
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
sudo dpkg -i cuda-repo-ubuntu1804_10.1.243-1_amd64.deb
sudo apt-get update -y
wget -nc http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb
sudo apt install ./nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb -y
sudo apt-get update -y

showStatus "Installing NVIDIA driver"
sudo apt-get install --no-install-recommends nvidia-driver-430 -y
# Reboot. Check that GPUs are visible using the command: nvidia-smi

showStatus "Installing development and runtime libraries (~4GB)"
sudo apt-get install -y --no-install-recommends \
    cuda-10-1 \
    libcudnn7=7.6.4.38-1+cuda10.1  \
    libcudnn7-dev=7.6.4.38-1+cuda10.1

showStatus "Installing TensorRT and libcudnn7"
sudo apt-get install -y --no-install-recommends libnvinfer6=6.0.1-1+cuda10.1 \
    libnvinfer-dev=6.0.1-1+cuda10.1 \
    libnvinfer-plugin6=6.0.1-1+cuda10.1

showStatus "Installing Google-Chrome"
wget -nc --content-disposition https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb

wget -qO- https://deb.opera.com/archive.key | sudo apt-key add -
sudo add-apt-repository "deb [arch=i386,amd64] https://deb.opera.com/opera-stable/ stable non-free"
sudo apt-get update -y
sudo apt-get install opera-stable -y

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

showStatus "Installing Synapse"
sudo apt-get install synapse -y

showStatus "Installing System Load Indicator"
sudo apt-get install indicator-multiload -y

showStatus "Installing LibreOffice"
sudo apt-get install libreoffice -y

showStatus "Installing VLC"
sudo apt-get update
sudo apt-get install vlc browser-plugin-vlc -y
mkdir ~/.cache/vlc

showStatus "Installing tweak"
sudo apt-get install gnome-tweak-tool -y

showStatus "Installing numix icon and wallpaper pack"
sudo add-apt-repository ppa:numix/ppa -y
sudo apt-get update
sudo apt-get install numix-gtk-theme numix-icon-theme-circle numix-icon-theme-square -y

showStatus "Installing Plank"
sudo add-apt-repository ppa:ricotz/docky -y
sudo apt-get update -y
sudo apt-get install plank -y

showStatus "Adding Plank to autostart"
cat > ~/.config/autostart/plank.desktop <<EOL
[Desktop Entry]
Type=Application
Exec=plank
Hidden=false
NoDisplay=false
Name[en_US]=plank
Name=plank
Comment[en_US]=plank
Comment=plank
X-GNOME-Autostart-Delay=2
X-GNOME-Autostart-enabled=true
EOL

showStatus "Installing Youtube Downloader"
sudo apt-get install youtube-dl -y

showStatus "Installing Cheese/Webcam app"
sudo apt-get install cheese -y

showStatus "Installing skype"
wget -nc https://go.skype.com/skypeforlinux-64.deb
sudo apt-get install ./skypeforlinux-64.deb -y

showStatus "Installing teamviewer"
wget -nc --content-disposition https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
sudo gdebi -n teamviewer*.deb
sudo apt-get -f install -y

showStatus "Installing qbittorrent"
sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable -y
sudo apt-get update -y
sudo apt-get install qbittorrent -y

showStatus "Changing Magnet settings"
sudo apt-get purge transmission-gtk -y
xdg-mime query default x-scheme-handler/magnet
gvfs-mime --query x-scheme-handler/magnet
xdg-mime default qBittorent.desktop x-scheme-handler/magnet
gvfs-mime --set x-scheme-handler/magnet qBittorrent.desktop

showStatus "Installing gimp"
sudo add-apt-repository ppa:otto-kesselgulasch/gimp -y
sudo apt-get update -y
sudo apt-get install gimp -y

showStatus "Installing gparted"
sudo apt-get install gparted -y

showStatus "Installing tor browser"
wget -q -O - https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | sudo apt-key add -
echo "deb https://deb.torproject.org/torproject.org $(lsb_release -cs) main" | sudo tee -a /etc/apt/sources.list
sudo apt-get update -y
sudo apt-get install tor deb.torproject.org-keyring torbrowser-launcher -y

showStatus "Installing IRC client - Konversation"
sudo apt-get install konversation -y

showStatus "Installing pomodo"
sudo apt-get install gnome-shell-pomodoro -y

showStatus "Installing sublime"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update -y
sudo apt-get install sublime-text -y

showStatus "Installing postman"
wget -nc --content-disposition https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
sudo tar -xzf postman.tar.gz -C /opt
rm postman.tar.gz
sudo ln -s /opt/Postman/Postman /usr/bin/postman

showStatus "Adding postman to launcher"
cat > ~/.local/share/applications/postman.desktop <<EOL
[Desktop Entry]
Encoding=UTF-8
Name=Postman
Exec=postman
Icon=/opt/Postman/app/resources/app/assets/icon.png
Terminal=false
Type=Application
Categories=Development;
EOL

showStatus "Installing Machine Learning packages"
python3 -m pip install jupyter notebook tensorflow tensorflow-gpu scikit-learn scipy matplotlib tensorflow_datasets tensorflow-hub

showStatus "Installing TLP for power saving"
sudo apt-get install tlp tlp-rdw -y
sudo tlp start

showStatus "Removing guest account"
sudo sh -c 'showStatus "[Seat:*]\nallow-guest=false\n" >/etc/lightdm/lightdm.conf.d/50--guest.conf'

showStatus "Removing Amazon"
echo 'Hidden=true' | cat /usr/share/applications/ubuntu-amazon-default.desktop - > ~/.local/share/applications/ubuntu-amazon-default.desktop

showStatus "Setting vim as default editor"
sudo update-alternatives --set editor /usr/bin/vim.basic

# Background color values
# Default: Login Screen
COLOR_HEX_ORIGINAL=2c001e
# Default: GRUB
COLOR_RGB_ORIGINAL=44,0,30
# Default: Splash Screen
COLOR_PERCENT_ORIGINAL="0.16, 0.00, 0.12"

# New Values
COLOR_HEX=222831
COLOR_RGB=34,40,49
COLOR_PERCENT="0.17, 0.00, 0.12"

showStatus "Fixing Grub background"
sudo sed -i "s/$COLOR_RGB_ORIGINAL/$COLOR_RGB/g" /usr/share/plymouth/themes/default.grub

showStatus "Fixing Splash Screen"
sudo sed -i "s/Window.SetBackgroundTopColor ($COLOR_PERCENT_ORIGINAL);/Window.SetBackgroundTopColor ($COLOR_PERCENT);/g" /usr/share/plymouth/themes/ubuntu-logo/ubuntu-logo.script
sudo sed -i "s/Window.SetBackgroundBottomColor ($COLOR_PERCENT_ORIGINAL);/Window.SetBackgroundBottomColor ($COLOR_PERCENT);/g" /usr/share/plymouth/themes/ubuntu-logo/ubuntu-logo.script
sudo update-initramfs -u

showStatus "Fixing Login Screen"
sudo sed -i "s/$COLOR_HEX_ORIGINAL/$COLOR_HEX/g" /usr/share/gnome-shell/theme/gdm3.css

showStatus "Installing GRUB theme"
cd /usr/share/grub/
sudo mkdir themes
cd themes
sudo git clone https://github.com/lfelipe1501/Atomic-GRUB2-Theme.git
sudo mv Atomic-GRUB2-Theme/Atomic ./
sudo rm -rf Atomic-GRUB2-Theme
sudo grep -v GRUB_THEME < /etc/default/grub > /tmp/clean_grub
sudo mv /tmp/clean_grub /etc/default/grub
sudo echo "GRUB_THEME=/usr/share/grub/themes/Atomic/theme.txt" >> /etc/default/grub
sudo update-grub

showStatus "Remove duplicate sources"
sudo apt-get install python3-apt python3-regex -y
curl -LO https://github.com/davidfoerster/aptsources-cleanup/releases/download/v0.1.6.3/aptsources-cleanup.zip
sudo python3 -OEs aptsources-cleanup.zip

showStatus "Update everything"
sudo apt-get install ubuntu-restricted-extras -y && sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt-get autoremove -y
