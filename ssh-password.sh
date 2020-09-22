#!/bin/bash

sudo sed -i "s/#Port 22/Port 2222/" /etc/ssh/sshd_config
sudo sed -i "s/#HostKey \/etc\/ssh\/ssh_host_rsa_key/HostKey \/etc\/ssh\/ssh_host_rsa_key/" /etc/ssh/sshd_config
sudo sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/" /etc/ssh/sshd_config
sudo sed -i "s/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/" /etc/ssh/sshd_config

sudo service ssh restart
#sudo dpkg-reconfigure openssh-server