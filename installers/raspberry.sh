printf "\nUpdate Raspberry Pi\n"
sudo apt-get update -y && sudo apt-get full-upgrade -y && sudo apt-get clean -y && sudo apt-get autoremove -y

printf "\nInstalling essential tools\n"
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

