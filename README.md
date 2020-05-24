# Web hosting utility scripts
This is a collection of scripts I use to quickly start webservers, among other things. They are tested on CentOS 7 virtual machines hosted on Oracle Cloud Infrastructure. **These scripts are unlikely to be maintained!**

## website-setup.sh:
This script installs nginx and configures it for a given website name and URL. It also creates the required directories, sets permissions on them, and enables the sebool httpd network connect parameter. You should place your *static* website files in /var/www/<site-name>/public_html once this script has been executed.
  
### Usage:
``./website-setup.sh <site-name> <site-url>``
  
