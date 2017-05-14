# vim
My vim settings, terminal settings and installer

## Usage

- vimrc

  ```
  cp vimrc ~/.vimrc
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginInstall
  ```

- bash_profile

- terminal_settings.terminal

- sweeper

  ```
  chmod +x sweeper
  ./sweeper
  ```

## Issues

### Autocomplete (Neocomplete) doesn't work in Vim
Error: It requires Vim 7.3.885 or later with Lua support ("+lua")
Fix: [install vim-nox](https://github.com/spf13/spf13-vim/issues/773)
