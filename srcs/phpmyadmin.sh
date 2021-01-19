cd /var/www/html
apt install -y php-json php-mbstring
apt install wget
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
tar -zxvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
rm phpMyAdmin-4.9.0.1-all-languages.tar.gz
mkdir phpmyadmin
mv phpMyAdmin-4.9.0.1-all-languages/* phpmyadmin
rm -rf phpMyAdmin-4.9.0.1-all-languages
rm phpmyadmin/config.sample.inc.php
