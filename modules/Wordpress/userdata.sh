#!/bin/bash
# Update all installed packages
yum update -y

# Install Apache, PHP, and MariaDB
yum install -y httpd wget php-fpm php-mysqli php-json php mariadb105-server

# Start and enable the web server and database to run on boot
systemctl start httpd
systemctl enable httpd
systemctl start mariadb
mysql -e "CREATE DATABASE wordpress_db;"
mysql -e "CREATE USER 'wp_user'@'localhost' IDENTIFIED BY 'wp_password';"
mysql -e "GRANT ALL PRIVILEGES ON wordpress_db.* TO 'wp_user'@'localhost';"
mysql -e "FLUSH PRIVILEGES;"
systemctl enable mariadb

# Download and extract the latest WordPress build
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz

# Move WordPress files to the Apache document root
cp -r wordpress/* /var/www/html/

# Grant the Apache web server ownership of the WordPress files
chown -R apache:apache /var/www/html/
chmod -R 755 /var/www/html/