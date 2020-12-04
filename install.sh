#!/bin/bash
sudo yum install nginx
sudo systemctl start nginx
sudo systemctl enable nginx
sudo yum install mariadb-server mariadb
sudo systemctl start mariadb
sudo mysql_secure_installation
sudo systemctl enable mariadb
sudo yum-config-manager --enable remi-php74
sudo yum install php php-mysqlnd php-fpm
php --version
sleep 3
cp www.conf /etc/php-fpm.d/

sudo systemctl start php-fpm
cp default.conf /etc/nginx/conf.d/
sudo systemctl restart nginx

cp info.php /usr/share/nginx/html/

