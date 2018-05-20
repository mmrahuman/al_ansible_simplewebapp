#!/usr/bin/env bash
sudo apt-get -y update
if [ $(dpkg-query -W -f='${Status}' git 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
   sudo apt-get -y install git
fi
echo "GIT installed"

#Copy keys to vagrant user
if [ -f '/home/vagrant/.ssh/authorized_keys' ]; then
 cat /home/vagrant/init/keys/authorized_keys >> /home/vagrant/.ssh/authorized_keys
fi

#Copy keys to root user
if [ ! -d '/root/.ssh/' ]; then
 sudo cp -R /home/vagrant/.ssh /root/
fi
