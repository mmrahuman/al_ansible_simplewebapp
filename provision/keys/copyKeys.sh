#Copy keys to root user - required for ansible as it sudo's
sudo su - 
cd ~ 
if [ ! -d '.ssh' ]; then 
    mkdir .ssh 
fi 
cd .ssh 
cp /home/vagrant/al_ansible_simplewebapp/provision/keys/id_rsa* .
cp /home/vagrant/al_ansible_simplewebapp/provision/keys/authorized_keys .
chmod 600 id_rsa

#Copy keys to vagrant user
if [ -d '/home/vagrant/.ssh/authorized_keys' ]; then
 cat /home/vagrant/al_ansible_simplewebapp/provision/keys/authorized_keys >> /home/vagrant/.ssh/authorized_keys
fi

