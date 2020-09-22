# wsl-setup

## Initial WSL Setup:

- dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
- wsl --set-default-version 2
- Download Ubuntu in Microsoft Store
- wsl.exe --set-version Ubuntu-20.04 2
- wsl -s Ubuntu-20.04

## TODO Reset WSL


## Configure WSL

- Git is already installed
- git clone https://github.com/simon-an/wsl-setup.git
- ./setup.sh
- Optional: https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k
- p10k configure

## Features: 

- zsh
- ohmyzsh
- fuck
- unzip/zip
- pip3
- sdkman
- adopt openjdk
- maven
- copy some data under ~ to a backup folder under windows 
- ssh port change and username/password login

## TODOS:

    - test agnoster theme
    - ssh with keys
    - no hardcoded backup
    - more config options