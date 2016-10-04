#! /bin/bash

#update
sudo apt-get update
echo 'Jumanji - update completed'

sudo apt-get install -y vim

#update/install JAVA jdk and jre
sudo apt-get install -y openjdk-7-jdk

echo 'Jumanji - Java installed/updated'

#disable firewall
sudo ufw disable
