# wsl-setup

## Initial WSL Setup:

- dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
- wsl --set-default-version 2
- Download Ubuntu in Microsoft Store
- wsl.exe --set-version Ubuntu-20.04 2
- wsl -s Ubuntu-20.04

## TODO Reset WSL


## Configure WSL

- Optional: pass your CMDER_ROOT to wsl like this in cmd: 'setx WSLENV CMDER_ROOT/up'. This will use the credential-manager.exe from gitbash to reuse the credentials stored in windows.
- Optional: create a private/gitclone.sh which will clone the repos for you.
- Git is already installed in wsl!
- but don't forget to import your private gpg key like so:  'gpg --import /mnt/.../privatekey'
- open wsl in windows terminal
- git clone https://github.com/simon-an/wsl-setup.git
- export WINDOWS_HOME=~+ 
- echo $WINDOWS_HOME should be something like /mnt/c/Users/<USERNAME>
- cd wsl-setup
- if you use git cp variables-template to private/.variables and provide your secrets.
- chmod +x setup.sh
- ./setup.sh
- Optional: p10k configure if you want to change the config or edit .p10k.zsh for more customization

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