apt update
apt install vim -y
apt install nginx -y
cd /var/www/html/
apt install -y mariadb-server
service mysql start
mariadb < /home/init_db.sql
cd /var/www/html/
apt install -y curl
curl -O https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
rm latest.tar.gz
