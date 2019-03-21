cd ~/Downloads

echo "Updating"
sudo dnf update -y


echo "Changing hostname"
hostnamectl set-hostname --static "forksociety.com"

echo "Installing Essentials"
sudo dnf -y install vim-enhanced tmux gnupg zsh curl wget
sudo dnf install wget curl screen chrome-gnome-shell -y
sudo dnf install fedora-workstation-repositories -y

echo "Installing Chrome"
sudo dnf config-manager --set-enabled google-chrome
sudo dnf install google-chrome-stable -y

echo "Installing Thunderbird and EnigMail"
sudo dnf install thunderbird thunderbird-enigmail -y

echo "Installing and configuring git"
sudo dnf install git -y
git config --global user.name "PrabhanshuAttri"
git config --global user.email "contact@prabhanshu.com"
git config --global core.editor "vim"
mkdir ~/github

echo "Installing Sublime"
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
sudo dnf install sublime-text -y

#echo "Installing Atom"
#sudo rpm --import https://packagecloud.io/AtomEditor/atom/gpgkey
#sudo sh -c 'echo -e "[Atom]\nname=Atom Editor\nbaseurl=https://packagecloud.io/AtomEditor/atom/el/7/\$basearch\nenabled=1\ngpgcheck=0\nrepo_gpgcheck=1\ngpgkey=https://packagecloud.io/AtomEditor/atom/gpgkey" > /etc/yum.repos.d/atom.repo'
#sudo dnf install atom -y

echo "Installing NVM and NodeJS"
unset NVM_DIR
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
nvm install 10.15.3
nvm use 10

echo "Installing Codecs"
sudo dnf install http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install gstreamer1-plugins-base gstreamer1-plugins-good gstreamer1-plugins-ugly gstreamer1-plugins-bad-free gstreamer1-plugins-bad-free gstreamer1-plugins-bad-freeworld gstreamer1-plugins-bad-free-extras ffmpeg -y

echo "Installing VLC"
sudo dnf install vlc -y

echo "Installing qbittorrent"
sudo dnf -y install qbittorrent -y

echo "Installing Spotify"
sudo dnf config-manager --add-repo=http://negativo17.org/repos/fedora-spotify.repo
sudo dnf install spotify -y

echo "Installing Skype"
wget --trust-server-names https://go.skype.com/skypeforlinux-64.rpm
sudo dnf install skypeforlinux*.rpm -y

echo "Installing youtube-dl"
sudo dnf install youtube-dl -y

echo "Installing Cowsay and Fortune"
sudo dnf install cowsay fortune-mod -y

echo "Installing Tweak Tool"
sudo dnf install gnome-tweak-tool -y

echo "Installing Numix Icon and theme"
sudo dnf install numix-icon-theme-circle -y

echo "Installing vim"
sudo dnf install vim -y
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "Install Vundles"
echo | echo | vim +PluginInstall +qall &>/dev/null

cd
