#!/bin/bash
 
if [ ! -f ~/ex1 ]
then
 
  sudo echo '192.168.33.104 mysqldb' | sudo tee -a /etc/hosts
  touch ~/ex1
fi
