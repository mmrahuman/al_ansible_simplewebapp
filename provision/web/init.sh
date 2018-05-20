#!/usr/bin/env bash

# Install Ansible
if [ $(dpkg-query -W -f='${Status}' ansible 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
    echo "installing ansible ..."
    sudo apt-get -y update
    sudo apt-get -y install software-properties-common
    sudo apt-add-repository -y ppa:ansible/ansible 
    sudo apt-get -y update
    sudo apt-get -y install ansible
    echo "ANSIBLE INSTALLED"
fi

if [ $(dpkg-query -W -f='${Status}' git 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
   sudo apt-get -y install git
fi

if [ $(dpkg-query -W -f='${Status}' python-mysqldb 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
   sudo apt-get -y install python-mysqldb
fi

#Copy keys to root user - required for ansible as it sudo's
sudo su -
cd ~
if [ ! -d '.ssh' ]; then
    mkdir .ssh
fi
cd .ssh
cp /home/vagrant/init/keys/id_rsa* .
cp /home/vagrant/init/keys/authorized_keys .
chmod 600 id_rsa

