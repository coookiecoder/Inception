if [ ! -f "wp-config.php" ]; then
	wp core download --allow-root

	wp config create --dbname=$MYSQL_BASE --dbhost=$MYSQL_HOST --dbuser=$MYSQL_UNAME --dbpass=$MYSQL_UPASS --dbcharset="utf8" --allow-root

	wp core install --url=abareux.42.fr --title=$WORDPRESS_TITLE --admin_user=$WORDPRESS_ANAME --admin_password=$WORDPRESS_APASS --admin_email=$WORDPRESS_AMAIL --skip-email --allow-root

	wp theme install popularfx --activate --allow-root
	wp user create $WORDPRESS_UNAME $WORDPRESS_UMAIL --user_pass=$WORDPRESS_UPASS --role=author --allow-root

	wp post create --post_type=post --post_title="Test Post" --post_status=publish --allow-root
fi

php-fpm8.2 -F
