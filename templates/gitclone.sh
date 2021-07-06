#!/bin/bash
PREV_FOLDER=~+ 
mkdir -p ~/projects/work && cd ~/projects/work
git clone 1
git clone 2

mkdir -p ~/projects/work/projecta && cd ~/projects/work/projecta
git clone 1
git clone 2

mkdir -p ~/projects/work/projectb && cd ~/projects/work/projectb
git clone 1
git clone 2
git clone 3
git clone 4
git clone 5
git clone 6

cd -
mkdir ~/projects/github && cd ~/projects/github
git clone 1
git clone 2

cd $PREV_FOLDER