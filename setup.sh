#!/bin/bash
echo "Installing zsh and oh-my-zsh\n"

sudo apt -y install zsh 
sudo apt autoremove
nohup sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) &"

echo "Waiting 3 seconds for ohmyzsh install"
sleep 3
# cat nohup.out
rm nohup.out

cp .zshrc ~
cp .p10k.zsh ~
cp .aliase ~
cp private/.variables ~

echo "------------------------------------------------------------------------"
echo "Installing powerlevel10k\n"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "---------------------------------l---------------------------------------"
echo "Installing ZSH plugins"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting



echo "------------------------------------------------------------------------"
echo "Installing RUST"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh


echo "------------------------------------------------------------------------"
echo "Installing PIP and thefuck"
sudo apt -y update
sudo apt -y install python3-dev python3-pip python3-setuptools
sudo pip3 install thefuck

echo "------------------------------------------------------------------------"
echo "Installing sdkman"

sudo apt -y install unzip
sudo apt -y install zip
export SDKMAN_DIR=$HOME/.sdkman  
curl -s "https://get.sdkman.io?rcupdate=false" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

echo "------------------------------------------------------------------------"
echo "Setting Git Credential Manager to use the one in windows git-credential-manager.exe"
if [ -n "$CMDER_ROOT" ]; then
    git config --global credential.helper "$CMDER_ROOT/vendor/git-for-windows/mingw64/libexec/git-core/git-credential-manager.exe"
else 
    echo "variable CMDER_ROOT not defined"
    echo Do you want set credential.helper to 'store' to cache git credentials?
    read answer

    if [ "$answer" = "yes" ]; then
        git config --global credential.helper store
        echo git config --global credential.helper store
    else 
        echo No git credential.helper configured
    fi
fi

echo "------------------------------------------------------------------------"
echo "Cloning Repos"
source private/gitclone.sh

echo "------------------------------------------------------------------------"
echo Do you want to install JDK 16? type yes
read answer

if [ "$answer" = "yes" ]; then
    echo "------------------------------------------------------------------------"
    echo "Installing Adopt OpenJdk"
    wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | sudo apt-key add -
    sudo add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
    sudo apt install -y software-properties-common
    sudo apt install -y adoptopenjdk-16-hotspot
else 
    echo Skipped java installation
fi

echo "------------------------------------------------------------------------"
echo Do you want to install gradle? type yes
read answer

if [ "$answer" = "yes" ]; then

    echo "Installing Gradle with sdkman"
    sdk install gradle
else 
    echo Skipped java installation
fi

echo "------------------------------------------------------------------------"
echo Do you want to restore backups? type yes
read answer
if [ "$answer" = "yes" ]; then

    source restore-backup.sh
else 
    echo Skipped backups
fi


echo "------------------------------------------------------------------------"
echo Do you want to install azure cli? type yes
read answer

if [ "$answer" = "yes" ]; then

    echo "Uninstalling outdated azurec-li from ubuntu disto"
    sudo apt remove azure-cli -y && sudo apt autoremove -y   
    echo "Installing ..."
    curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
else 
    echo Skipped az installation
fi


sudo chsh -s $(which zsh)

zsh -l