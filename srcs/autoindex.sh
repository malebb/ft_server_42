if [ -z $AUTOINDEX ]; then
	exit 0;
elif [ $AUTOINDEX = off ]
then
	sed -i -e 's/autoindex on/autoindex off/g' /etc/nginx/conf.d/mywebsite.conf
fi
