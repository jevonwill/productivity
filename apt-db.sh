#!/bin/bash
#Script to install LAMP prereqs, open HTTP ports and start the DB/wensever
sudo dnf install expect -y

#Set root password

#Install MariaDB
sudo dnf install mariadb-server

#Open HTTP and optionally HTTPS port 80 and 443 on your firewall:
sudo firewall-cmd --permanent --zone=public --add-service=http
sudo firewall-cmd --permanent --zone=public --add-service=https
sudo firewall-cmd --reload

#Start amd then enable MariaDB
sudo systemctl start mariadb
sudo systemctl enable mariadb

#Secure your MariaDB installation and set root password:

