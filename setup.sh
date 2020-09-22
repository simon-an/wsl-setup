#!/bin/bash

echo "Installing zsh and oh-my-zsh\n"

sudo apt -y install zsh 
sudo apt autoremove
nohup sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) &"

echo "Waiting 3 seconds for ohmyzsh install"
sleep 3
cat nohup.out
rm nohup.out

cp .zshrc ~

echo "------------------------------------------------------------------------"
echo "Installing powerlevel10k\n"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "---------------------------------l---------------------------------------"
echo "Installing ZSH plugins"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "------------------------------------------------------------------------"
echo "Installing Adopt OpenJdk"
wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | sudo apt-key add -
sudo add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
sudo apt install -y software-properties-common
sudo apt install -y adoptopenjdk-14-hotspot

echo "------------------------------------------------------------------------"
echo "Installing PIP and thefuck"
sudo apt -y update
sudo apt -y install python3-dev python3-pip python3-setuptools
sudo pip3 install thefuck

echo "------------------------------------------------------------------------"
echo "Installing sdkman"

sudo apt -y install unzip
sudo apt -y install zip
curl -s "https://get.sdkman.io" | bash

zsh -l