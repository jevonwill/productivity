#!/bin/bash
#Script to install LAMP prereqs, open HTTP ports and start the DB/wensever
sudo dnf install expect -y
sudo yum -y install epel-release

rpm -Uvh http://rpms.remirepo.net/enterprise/remi-release-7.rpm

sudo yum -y install yum-utils

sudo yum-config-manager --enable remi-php72 -y

sudo yum update

#Set root password

#Install MariaDB
sudo dnf php-mysqlnd php-fpm mariadb-server httpd tar curl php-json

#Open HTTP and optionally HTTPS port 80 and 443 on your firewall:
sudo firewall-cmd --permanent --zone=public --add-service=http
sudo firewall-cmd --permanent --zone=public --add-service=https
sudo firewall-cmd --reload

#Start amd then enable MariaDB
sudo systemctl start mariadb
sudo systemctl enable mariadb

sudo systemctl start httpd
sudo systemctl enable httpd


#Secure your MariaDB installation and set root password:

