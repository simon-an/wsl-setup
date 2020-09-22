#!/bin/bash

shopt -s expand_aliases

sudo apt remove zsh -y
env ZSH="$ZSH" sh "$ZSH/tools/uninstall.sh"

sudo apt remove -y software-properties-common
sudo apt remove -y adoptopenjdk-14-hotspot