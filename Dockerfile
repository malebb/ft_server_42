FROM    debian:buster

COPY	srcs/init_db.sql /home/

COPY	srcs/db_wordpress.sh /home/

COPY	srcs/phpmyadmin.sh /home/

RUN	chmod 777 /home/db_wordpress.sh /home/phpmyadmin.sh && \
	./home/db_wordpress.sh
RUN	apt install php-fpm -y && \
	apt install php-mysql -y

COPY	srcs/mywebsite.conf /etc/nginx/conf.d/

COPY	srcs/wp-config-sample.php /var/www/html/wordpress/

RUN	mv /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php && \
	rm /etc/nginx/sites-enabled/default

RUN	./home/phpmyadmin.sh

COPY	srcs/phpmyadmin.conf /etc/nginx/snippets/

COPY	srcs/config.inc.php /var/www/html/phpmyadmin

RUN	mkdir /etc/nginx/ssl/ && \
	openssl req -x509 -newkey rsa:4096 -keyout /etc/nginx/ssl/key.pem -out /etc/nginx/ssl/cert.pem -days 365 -nodes -subj '/CN=localhost'

COPY	srcs/autoindex.sh /home/

ENTRYPOINT	service nginx restart && \
		service php7.3-fpm start && \
		service mysql start && \
		./home/autoindex.sh && \
		bash
	
