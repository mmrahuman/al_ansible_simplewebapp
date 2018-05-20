This package consists of Vagrantfile and related files to deploys ansible, nginx and tomcat. 
This deploys 4 servers - 1 server (ansible / nginx) and 2 app servers (tomcat) and 1 database server(mysql). Please follow the steps below:

Prerequisites:
Vagrant Installed
Internet connected

Product versions:
Vagrant 2.1.1
ansible 2.5.3
nginx version: nginx/1.4.6 (Ubuntu)
tomcat v7
mysql  Ver 14.14 Distrib 5.5.60

 

1. Download package from 
https://github.com/raamkres/al_ansible_simplewebapp.git

2. Unzip the downloaded al_ansible_simplewebapp-master.zip file

3. Execute "vagrant up" from al_ansible_simplewebapp-master folder.

4. During the process you will be asked to select a network - "Which interface should the network bridge to?", please select the one that connects to internet. 

5. After the process completes, you can access the javaapp using:
   http://localhost:8081/javaapp/
   http://localhost:8081/javaapp/viewCustomers.jsp - this will connect to mysql db and extract customer details
   
