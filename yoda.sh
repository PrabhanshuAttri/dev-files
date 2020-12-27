#!/bin/bash

function showStatus() {
	printf "\n${1}\n"
  printf "#######################################\n"
}

showStatus "Do or do not, there is no try."
# How to export gpg keys
# gpg --export-secret-keys > secret.asc
# gpg --export-ownertrust > trust_db.txt
# git config --global user.signingkey {key}

function commons() {
  cd
  showStatus "Cloning dotfiles"
  git clone https://github.com/PrabhanshuAttri/dotfiles.git
  cd dotfiles
  chmod +x ./installers/*

  showStatus "Copying dotfiles"
  cp bash_profile ~/.bash_profile
  cp tmux.conf ~/.tmux.conf
  cp vimrc ~/.vimrc
  cp zshrc ~/.zshrc

  showStatus "Copying fonts"
  cp -rf fonts ~/.fonts
}

function setGpg() {
  GPG_SECRET=~/secrets/secret.asc
  GPG_TRUSTDB=~/secrets/trust_db.txt
  if [ -f GPG_SECRET ] && [ -f GPG_TRUSTDB ];
  then
    showStatus "GPG"
    gpg --import $GPG_SECRET
    gpg --import-ownertrust $GPG_TRUSTDB

    git config --global commit.gpgsign true
    gpgconf --kill gpg-agent
  fi
}

function fedora() {
  commons
  showStatus "Installing required packages"
  ./installers/fedora.sh
}

function ubuntu() {
  rm -rf ~/.oh-my-zsh
  commons
  showStatus "Ubuntu"
  ./installers/ubuntu.sh
}

function mac() {
  commons
  showStatus "Mac OSX"
  brew update
}

showStatus "Detecting OS"
mac=Mac
linux=Linux
other=Other

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)
      machine="$linux"
      showStatus "OS Detected: ${machine}"
      distro="$(awk -F= '/^NAME/{print $2}' /etc/os-release | sed -e 's/^"//' -e 's/"$//')"

      case "${distro}" in
        Ubuntu*)
          ubuntu
          ;;
        Fedora*)
          fedora
          ;;
         *)
          ;;
       esac

      setGpg gpg2
      ;;
    Darwin*)
      machine="$mac"
      showStatus "OS Detected: ${machine}"
      mac
      setGpg gpg
      ;;
    *)
      machine="${unameOut}"
      showStatus "OS Detected: ${machine}"
      showStatus "OS Not Supported. Please install vim, tmux, cowsay, fortune-mod, nvm and zsh manually"
      ;;
esac

showStatus "Installing tmux plugins"
rm -rf ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/scripts/install_plugins.sh
tmux source ~/.tmux.conf

showStatus "Installing Vim Vundles"
rm -rf ~/.vim/bundle/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

cd ../
rm -rf dotfiles

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
