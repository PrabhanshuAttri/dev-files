echo "Do or do not, there is no try."

function fedora() {
  echo "Installing required packages"
  sudo dnf -y update
  sudo dnf -y install vim-enhanced tmux cowsay fortune-mod
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
}

function mac() {
  echo "Mac OSX"
}

unameOut="$(uname -s)"

mac=Mac
linux=Linux
other=Other
case "${unameOut}" in
    Linux*)
      machine="$linux"
      echo "OS Detected: ${machine}"
      fedora
      ;;
    Darwin*)
      machine="$mac"
      echo "OS Detected: ${machine}"
      mac
      ;;
    *)
      machine="${unameOut}"
      echo "OS Detected: ${machine}"
      echo "OS Not Supported. Please install vim, tmux, cowsay, fortune-mod, nvm and zsh manually"
      ;;
esac

echo "Cloning dotfiles"
git clone git@github.com:PrabhanshuAttri/dotfiles.git
cd dotfiles

echo "Copying dotfiles"
cp bash_profile ~/.bash_profile
cp tmux.conf ~/.tmux.conf
cp vimrc ~/.vimrc
cp zshrc ~/.zshrc
cd ../
rm -rf dotfiles

echo "Installing tmux plugins"
rm -rf ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/scripts/install_plugins.sh
tmux source ~/.tmux.conf

echo "Installing Vim Vundles"
rm -rf ~/.vim/bundle/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

