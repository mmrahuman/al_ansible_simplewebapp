#!/usr/bin/env bash
sudo apt-get -y update
sudo apt-get -y install git


#Install MySQL
sudo su -

#Set password for scripted install
echo mysql-server mysql-server/root_password select root | debconf-set-selections
echo mysql-server mysql-server/root_password_again select root | debconf-set-selections
apt-get install -y mysql-server

#Copy keys to vagrant user
if [ -f '/home/vagrant/.ssh/authorized_keys' ]; then
 cat /home/vagrant/init/keys/authorized_keys >> /home/vagrant/.ssh/authorized_keys
fi

#Copy keys to root user
if [ ! -d '/root/.ssh/' ]; then
 sudo cp -R /home/vagrant/.ssh /root/
fi
