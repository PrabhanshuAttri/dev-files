echo "Do or do not, there is no try."

# How to export gpg keys
# gpg --export-secret-keys > secret.asc
# gpg --export-ownertrust > trust_db.txt

function setGpg() {
  GPG_PROGRAM=$1
  GPG_SECRET=secret.asc
  GPG_TRUSTDB=trust_db.txt
  if [ -f GPG_SECRET ] && [ -f GPG_TRUSTDB ];
  then
    echo "GPG"
    gpg --import GPG_SECRET
    gpg --import-ownertrust GPG_TRUSTDB

    git config --global commit.gpgsign true
    git config --global gpg.program $GPG_PROGRAM

    gpgconf --kill gpg-agent
  fi
}

function fedora() {
  echo "Installing required packages"
  ./installers/fedora
}

function ubuntu() {
  echo "Ubuntu"
}

function mac() {
  echo "Mac OSX"
  brew update
}

cd
echo "Cloning dotfiles"
git clone git@github.com:PrabhanshuAttri/dotfiles.git
cd dotfiles

echo "Copying dotfiles"
cp bash_profile ~/.bash_profile
cp tmux.conf ~/.tmux.conf
cp vimrc ~/.vimrc
cp zshrc ~/.zshrc

echo "Detecting OS"
mac=Mac
linux=Linux
other=Other

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)
      machine="$linux"
      echo "OS Detected: ${machine}"
      fedora
      setGpg gpg2
      ;;
    Darwin*)
      machine="$mac"
      echo "OS Detected: ${machine}"
      mac
      setGpg gpg
      ;;
    *)
      machine="${unameOut}"
      echo "OS Detected: ${machine}"
      echo "OS Not Supported. Please install vim, tmux, cowsay, fortune-mod, nvm and zsh manually"
      ;;
esac

echo "Installing tmux plugins"
rm -rf ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/scripts/install_plugins.sh
tmux source ~/.tmux.conf

echo "Installing Vim Vundles"
rm -rf ~/.vim/bundle/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

cd ../
rm -rf dotfiles

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
