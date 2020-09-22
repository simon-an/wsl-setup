#!/bin/bash

sudo sed -i "s/#Port 22/Port 2222/" /etc/ssh/sshd_config
sudo sed -i "s/#HostKey \/etc\/ssh\/ssh_host_rsa_key/HostKey \/etc\/ssh\/ssh_host_rsa_key/" /etc/ssh/sshd_config

#TODO

sudo service ssh restart
# Run this command once, to generate server keys.
#sudo dpkg-reconfigure openssh-server