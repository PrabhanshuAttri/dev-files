cd ~/Downloads

echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
sudo apt-get install ttf-mscorefonts-installer

printf "\nInstalling Update and Upgrade\n"
sudo apt-get install ubuntu-restricted-extras software-properties-common -y && sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt-get autoremove -y

printf "\nInstalling Google-Chrome\n"
wget -nc --content-disposition https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb

wget -qO- https://deb.opera.com/archive.key | sudo apt-key add -
sudo add-apt-repository "deb [arch=i386,amd64] https://deb.opera.com/opera-stable/ stable non-free"
sudo apt-get update -y
sudo apt-get install opera-stable -y

printf "\nInstalling dependencies\n"
sudo apt-get install apt-transport-https -y

printf "\nInstalling flush dns tool nscd\n"
sudo apt-get install nscd -y
sudo /etc/init.d/nscd restart

printf "\nInstalling Cowsay and Fortune\n"
sudo apt-get install cowsay fortune-mod -y

printf "\nInstalling Gdebi\n"
sudo apt-get install gdebi -y

printf "\nInstalling vim, tmux and zsh\n"
sudo apt-get install vim vim-nox zsh tmux -y

printf "\nInstalling Chrome Gnome Shell\n"
sudo apt-get install chrome-gnome-shell -y

printf "\nInstalling Curl\n"
sudo apt-get install curl -y

printf "\nRemoving Bloatware\n"
sudo apt-get remove account-plugin-aim account-plugin-google account-plugin-facebook account-plugin-flickr account-plugin-jabber account-plugin-salut account-plugin-twitter account-plugin-windows-live account-plugin-yahoo aisleriot brltty colord deja-dup deja-dup-backend-gvfs duplicity empathy empathy-common evolution-data-server-online-accounts example-content gnome-accessibility-themes gnome-contacts gnome-mahjongg gnome-mines gnome-orca gnome-sudoku gnome-video-effects gnomine landscape-common libsane libsane-common mcp-account-manager-uoa python3-uno rhythmbox rhythmbox-plugins rhythmbox-plugin-zeitgeist sane-utils shotwell shotwell-common telepathy-gabble telepathy-haze telepathy-idle telepathy-indicator telepathy-logger telepathy-mission-control-5 telepathy-salut thunderbird thunderbird-gnome-support totem totem-common totem-plugins unity-scope-audacious unity-scope-chromiumbookmarks unity-scope-clementine unity-scope-colourlovers unity-scope-devhelp unity-scope-gdrive unity-scope-gmusicbrowser unity-scope-gourmet unity-scope-manpages unity-scope-musicstores unity-scope-musique unity-scope-openclipart unity-scope-texdoc unity-scope-tomboy unity-scope-video-remote unity-scope-virtualbox unity-scope-yelp unity-scope-zotero -y

printf "\nInstalling Synapse\n"
sudo apt-get install synapse -y

printf "\nInstalling System Load Indicator\n"
sudo apt-get install indicator-multiload -y

printf "\nInstalling LibreOffice\n"
sudo apt-get install libreoffice -y

printf "\nInstalling VLC\n"
sudo apt-get update
sudo apt-get install vlc browser-plugin-vlc -y
mkdir ~/.cache/vlc

printf "\nInstalling tweak\n"
sudo apt-get install gnome-tweak-tool -y

printf "\nInstalling numix icon and wallpaper pack\n"
sudo add-apt-repository ppa:numix/ppa -y
sudo apt-get update
sudo apt-get install numix-gtk-theme numix-icon-theme-circle numix-icon-theme-square -y

printf "\nInstalling Plank\n"
sudo add-apt-repository ppa:ricotz/docky -y
sudo apt-get update -y
sudo apt-get install plank -y

printf "\nAdding Plank to autostart\n"
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

printf "\nInstalling Youtube Downloader\n"
sudo apt-get install youtube-dl -y

printf "\nInstalling skype\n"
wget https://go.skype.com/skypeforlinux-64.deb
sudo apt-get install ./skypeforlinux-64.deb -y

printf "\nInstalling teamviewer\n"
wget -nc --content-disposition https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
sudo gdebi -n teamviewer*.deb
sudo apt-get -f install -y

printf "\nInstalling qbittorrent\n"
sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable -y
sudo apt-get update -y
sudo apt-get install qbittorrent -y

printf "\nChanging Magnet settings\n"
sudo apt-get purge transmission-gtk -y
xdg-mime query default x-scheme-handler/magnet
gvfs-mime --query x-scheme-handler/magnet
xdg-mime default qBittorent.desktop x-scheme-handler/magnet
gvfs-mime --set x-scheme-handler/magnet qBittorrent.desktop

printf "\nInstalling gimp\n"
sudo add-apt-repository ppa:otto-kesselgulasch/gimp -y
sudo apt-get update -y
sudo apt-get install gimp -y

printf "\nInstalling gparted\n"
sudo apt-get install gparted -y

printf "\nInstalling tor browser\n"
wget -q -O - https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | sudo apt-key add -
echo "deb https://deb.torproject.org/torproject.org $(lsb_release -cs) main" | sudo tee -a /etc/apt/sources.list
sudo apt-get update -y
sudo apt-get install tor deb.torproject.org-keyring torbrowser-launcher -y

printf "\nInstalling IRC client - Konversation\n"
sudo apt-get install konversation -y

printf "\nInstalling git\n"
sudo apt-get install git -y

printf "\nInstalling sublime\n"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update -y
sudo apt-get install sublime-text -y

printf "\nInstalling postman\n"
wget -nc --content-disposition https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
sudo tar -xzf postman.tar.gz -C /opt
rm postman.tar.gz
sudo ln -s /opt/Postman/Postman /usr/bin/postman

printf "\nAdding postman to launcher\n"
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

printf "\nRemoving guest account\n"
sudo sh -c 'printf "\n[Seat:*]\nallow-guest=false\n" >/etc/lightdm/lightdm.conf.d/50-no-guest.conf'

printf "\nRemoving Amazon\n"
echo 'Hidden=true' | cat /usr/share/applications/ubuntu-amazon-default.desktop - > ~/.local/share/applications/ubuntu-amazon-default.desktop

printf "\nInstalling TLP for power saving\n"
sudo apt-get install tlp tlp-rdw -y
sudo tlp start

printf "\nRemove duplicate sources\n"
sudo apt-get install python3-apt python3-regex -y
curl -L https://github.com/davidfoerster/aptsources-cleanup/releases/download/v0.1.6.3/aptsources-cleanup.zip
sudo python3 -OEs aptsources-cleanup.zip

printf "\nUpdate everything\n"
sudo apt-get install ubuntu-restricted-extras -y && sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt-get autoremove -y
