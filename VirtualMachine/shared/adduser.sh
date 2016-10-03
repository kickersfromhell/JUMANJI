#!/usr/bin/env bash

#Script to add a new user

read -p "Enter your operating system [ubuntu/centos]" opsys

if [ "$opsys" = "centos" ]; then

echo "root ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

fi

while [ x$username = "x" ]; do

read -p "Please enter a username for the new account : " username

if id -u $username >/dev/null 2>&1; then

echo "User already exists"

username=""

fi

done

while [ x$group = "x" ]; do

read -p "Please enter the primary group. If group doesn't exist it will be created for you. (This is usually the same as your username) : " group

if id -g $group >/dev/null 2>&1; then

echo "Group exists"

else

sudo groupadd $group

fi

done

read -p "Please enter bash [/bin/bash] : " bash

if [ x"$bash" = "x" ]; then

bash="/bin/bash"

fi

read -p "Please enter a home directory [/home/$username] : " homedir

if [ x"$homedir" = "x" ]; then

homedir="/home/$username"

fi

read -p "Please confirm [y/n]" confirm

if [ "$confirm" = "y" ]; then

sudo useradd -g $group -s $bash -d $homedir -m $username

fi

if [ "$opsys" = "ubuntu" ]; then

sudo adduser $username sudo

else

#sudo sed -i -e "/root ALL=(ALL)ALL/a$username ALL=(ALL)ALL" /etc/sudoers
echo "$username ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
fi
