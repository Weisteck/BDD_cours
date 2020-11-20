#!/bin/bash

dnf install yum
yum install http://repo.mysql.com/mysql80-community-release-el8-1.noarch.rpm
yum module disable mysql
yum install mysql-community-server
service mysqld start
yum install mysql-workbench-community
firewall-cmd --list-services
firewall-cmd --get-services | grep mysql
firewall-cmd --add-service=mysql --permanent
firewall-cmd --reload

grep 'temporary password' /var/log/mysqld.log
