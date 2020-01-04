printf "\nUpdate Raspberry Pi\n"
sudo apt-get update -y && sudo apt-get full-upgrade -y && sudo apt-get clean -y && sudo apt-get autoremove -y

printf "\nInstalling essential tools\n"
sudo apt-get install nscd -y
sudo apt-get install cowsay fortune-mod -y
sudo apt-get install vim vim-nox -y
sudo apt-get install curl wget -y
sudo apt-get install youtube-dl -y
sudo apt-get install git htop -y

echo "fortune | cowsay -f tux" >> ~/.bash_profile
source ~/.bash_profile

