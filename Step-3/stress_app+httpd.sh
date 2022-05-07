#! /bin/bash
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install stress
sudo apt-get install mysql-client-core-8.0
sudo apt-get install -y apache2
sudo systemctl start apache2.service
echo "Hello world from $(hostname -f)" > /var/www/html/index.html
