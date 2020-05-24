#! /bin/bash

# Init the public html directory for our site
sudo mkdir -p /var/www/$1/public_html

# Install nginx
sudo yum -y install nginx

# Make our configuration file
sudo mkdir -p /etc/nginx/sites-available
sudo touch /etc/nginx/sites-available/$1.conf

# Set our nginx config
conf="server {
    listen 80;
    listen [::]:80;
    server_name $2;

    root /var/www/$1/public_html;

    index   index.html;

    location / {
            try_files \$uri \$uri/ =404;
    }
}
"

# Send this config to our file
echo "$conf" > /etc/nginx/sites-available/$1.conf

# Set directory permissions
sudo chcon -Rt httpd_sys_content_t /var/www
sudo chmod a+rwx /var/www

# Restart nginx
sudo systemctl restart nginx
