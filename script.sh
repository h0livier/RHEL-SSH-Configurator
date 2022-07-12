#!/bin/bash

# Variables usefull for the script
port='22222'
user=holivier


# Script body

# Installing the server
yum install openssh-server -y

# Creating and storing files containing the SSH key
mkdir "/home/$user/.ssh"
touch "/home/$user/.ssh/authorized_keys"

chown $user:$user "/home/$user/.ssh/"
chown $user:$user "/home/$user/.ssh/authorized_keys"

cat ssh-key.pub >> "/home/$user/.ssh/authorized_keys"
printf "\n" >> "/home/$user/.ssh/authorized_keys"

# Replacing values in the config file
sed -i -e "s/#Port 22/Port $port/" /etc/ssh/sshd_config
sed -i -e 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sed -i -e 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

# Restarting the service
systemctl restart sshd.service