# vim
My dot files.

## Usage

- Yoda.sh: Installs required softwares and copies bash_profile, tmux.conf, vimrc and zshrc

   ```        
   # Install zsh
   sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
   # Setup everything else
   curl -o- https://raw.githubusercontent.com/PrabhanshuAttri/dotfiles/master/yoda.sh | bash
   ```

- Sweeper: Removes credentials and settings from the system

   ```
   curl -H 'Cache-Control: no-cache' -o- https://raw.githubusercontent.com/PrabhanshuAttri/dotfiles/master/sweeper.sh | bash
   ```
   
## Issues

1. **Autocomplete (Neocomplete) doesn't work in Vim**

   Error: It requires Vim 7.3.885 or later with Lua support ("+lua")

   Fix: [install vim-nox](https://github.com/spf13/spf13-vim/issues/773)
