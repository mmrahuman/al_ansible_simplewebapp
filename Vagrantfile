# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  #Configure tomcat appSvr1
  config.vm.define "appSvr1" do |appSvr1|
	appSvr1.vm.box = "puppetlabs/ubuntu-14.04-64-nocm"
	appSvr1.vm.hostname = 'appSvr1'
	appSvr1.vm.box_url = "https://vagrantcloud.com/puppetlabs/boxes/ubuntu-14.04-64-nocm"

	#Update System and install git
	appSvr1.vm.provision "file", source: "~/al_ansible_simplewebapp/provision/appSvr", destination: "$HOME/init"
	appSvr1.vm.provision :shell, :inline => "chmod -R 755 init"
	appSvr1.vm.provision :shell, :inline => "cd init && ./init.sh && ./setupOnce.sh"

        #Checkout from git, remove if it exists already
	appSvr1.vm.provision :shell, :inline => "rm -rf al_ansible_simplewebapp && git clone https://github.com/raamkres/al_ansible_simplewebapp.git"
	appSvr1.vm.provision :shell, :inline => "chmod -R 755 al_ansible_simplewebapp"

	#Create bridge network
	appSvr1.vm.network "public_network", ip: "192.168.33.102"

  end

  #Configure tomcat appSvr2
  config.vm.define "appSvr2" do |appSvr2|
	appSvr2.vm.box = "puppetlabs/ubuntu-14.04-64-nocm"
	appSvr2.vm.hostname = 'appSvr2'
	appSvr2.vm.box_url = "https://vagrantcloud.com/puppetlabs/boxes/ubuntu-14.04-64-nocm"

	#Update System and install git
	appSvr2.vm.provision "file", source: "~/al_ansible_simplewebapp/provision/appSvr", destination: "$HOME/init"
	appSvr2.vm.provision :shell, :inline => "chmod -R 755 init"
	appSvr2.vm.provision :shell, :inline => "cd init && ./init.sh && ./setupOnce.sh"

	appSvr2.vm.provision :shell, :inline => "git clone https://github.com/raamkres/al_ansible_simplewebapp.git"
	appSvr2.vm.provision :shell, :inline => "chmod -R 755 al_ansible_simplewebapp"

	#Create bridge network
	appSvr2.vm.network "public_network", ip: "192.168.33.103"
  end
  
  #Configure mysql db
  config.vm.define "mysqldb" do |mysqldb|
	mysqldb.vm.box = "puppetlabs/ubuntu-14.04-64-nocm"
	mysqldb.vm.hostname = 'mysqldb'
	mysqldb.vm.box_url = "https://vagrantcloud.com/puppetlabs/boxes/ubuntu-14.04-64-nocm"

	#Update System and install git
	mysqldb.vm.provision "file", source: "~/al_ansible_simplewebapp/provision/db", destination: "$HOME/init"
	mysqldb.vm.provision :shell, :inline => "chmod -R 755 init"
	mysqldb.vm.provision :shell, :inline => "cd init && ./init.sh && ./dbQueries.sh"

	mysqldb.vm.provision :shell, :inline => "git clone https://github.com/raamkres/al_ansible_simplewebapp.git"
	mysqldb.vm.provision :shell, :inline => "chmod -R 755 al_ansible_simplewebapp"

	#Create bridge network
	mysqldb.vm.network "public_network", ip: "192.168.33.104"
  end

 #Configure ngnix / ansible master server
 config.vm.define "web" do |web|  
	web.vm.box = "puppetlabs/ubuntu-14.04-64-nocm"
	web.vm.hostname = "web"
	web.vm.box_url = "https://vagrantcloud.com/puppetlabs/boxes/ubuntu-14.04-64-nocm"
	web.vm.network "forwarded_port", guest: 80, host: 8081

	#Create bridged network
	web.vm.network "public_network", ip: "192.168.33.10"

	#Update System and install Ansible
	web.vm.provision "file", source: "~/al_ansible_simplewebapp/provision/web", destination: "$HOME/init"
	web.vm.provision :shell, :inline => "chmod -R 755 init"
	web.vm.provision :shell, :inline => "cd init && ./init.sh && ./setupOnce.sh"

	#Checkout Source from GitHub public repos
	web.vm.provision :shell, :inline => "git clone https://github.com/raamkres/al_ansible_simplewebapp.git"

	web.vm.provision :shell, :inline => "chmod -R 755 al_ansible_simplewebapp"
	web.vm.provision :shell, :inline => "cd al_ansible_simplewebapp/provision/keys && sudo cp id_rsa* /home/vagrant/.ssh/"

        #Install NGINx 
	web.vm.provision :shell, :inline => "echo 'Setting env parameter .....' && export ANSIBLE_CONFIG=/home/vagrant/al_ansible_simplewebapp/ansible/"
	web.vm.provision :shell, :inline => "cd al_ansible_simplewebapp/ansible && sudo ansible-playbook -i /home/vagrant/al_ansible_simplewebapp/ansible/hosts/inventory.yml main.yml"

	#NGINx status check
	web.vm.provision :shell, :inline => "sudo service nginx status"
	web.vm.provision :shell, :inline => "netstat -antp | grep LISTEN | grep 80"

 end
end

