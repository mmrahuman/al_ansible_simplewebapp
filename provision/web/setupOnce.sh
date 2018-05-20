#!/bin/bash
 
if [ ! -f ~/ex1 ]
then
 
  sudo echo '192.168.33.10 web' | sudo tee -a /etc/hosts
  sudo echo '192.168.33.102 appSvr1' | sudo tee -a /etc/hosts
  sudo echo '192.168.33.103 appSvr2' | sudo tee -a /etc/hosts 
  sudo echo '192.168.33.104 mysqldb' | sudo tee -a /etc/hosts
  touch ~/ex1
fi
