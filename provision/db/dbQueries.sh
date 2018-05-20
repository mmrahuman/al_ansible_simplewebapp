#bin/bash

sudo mysql -u root -proot -B -e "create database ALSWDB"
sudo mysql -u root -proot -B -e "create user 'aladmin'@'localhost identified by 'admin'"
sudo mysql -u root -proot -B -e "grant all on ALSWDB.* to 'aladmin' identified by 'admin'"
sudo mysql -u root -proot -B -e "use ALSWDB; create table customers (customer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, first_name TEXT, last_name TEXT)"

sudo mysql -u root -proot -B -e "use ALSWDB; insert into customers values(100, 'John', 'Smith')"
sudo mysql -u root -proot -B -e "use ALSWDB; insert into customers values(101, 'Roger', 'Federer')"
sudo mysql -u root -proot -B -e "use ALSWDB; insert into customers values(102, 'Novak', 'Djokovic')"
sudo mysql -u root -proot -B -e "use ALSWDB; insert into customers values(103, 'Rafa', 'Nadal')"
sudo mysql -u root -proot -B -e "use ALSWDB; insert into customers values(104, 'Pete', 'Sampras')"
sudo mysql -u root -proot -B -e "use ALSWDB; insert into customers values(105, 'Del', 'Potro')"
