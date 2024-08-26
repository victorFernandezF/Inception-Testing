#!/bin/ash

#https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-on-ubuntu-20-04-with-a-lamp-stack

WORDPRESS_FOLDER="/var/www/wordpress"
CONFIG_FILE="$WORDPRESS_FOLDER/wp-config.php"

if [ -f "/usr/bin/wp" ] && [ wp core is-installed ]; then
	echo "Wordpress is already installed..."
else
	cd /tmp && wget http://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz
	mkdir -p /tmp/wordpress/wp-content/upgrade
	cp -a /tmp/wordpress/. $WORDPRESS_FOLDER

	# Setup permissions
	chmod 755 -R $WORDPRESS_FOLDER
	chmod 644 -R $WORDPRESS_FOLDER

	cat << EOF > $CONFIG_FILE
	<?php
	define( 'DB_NAME', '$DB_NAME' );
	define( 'DB_USER', '$DB_USER' );
	define( 'DB_PASSWORD', '$DB_PASSWORD' );
	define( 'DB_HOST', 'mariadb' );
	define( 'DB_CHARSET', 'utf8' );
	define( 'DB_COLLATE', '' );
	define( 'FS_METHOD', 'direct');

EOF

	wget -qO - https://api.wordpress.org/secret-key/1.1/salt/ >> $CONFIG_FILE

	echo '$table_prefix = "wp_";' >> $CONFIG_FILE
	cat << EOF >> $CONFIG_FILE
	define( 'WP_DEBUG', false );
	if ( ! defined( 'ABSPATH' ) ) {
		define( 'ABSPATH', __DIR__ . '/' );
	}
	require_once ABSPATH . 'wp-settings.php';
EOF

	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/bin/wp
	wp core install --allow-root --url=https://victofer.42.fr --title=victofer \
		--admin_user=$WP_USER --admin_password=$WP_PASSWORD \
		--admin_email=$WP_EMAIL --path=$WORDPRESS_FOLDER
fi

chown -R victofer:wp_group $WORDPRESS_FOLDER && chmod -R 775 $WORDPRESS_FOLDER

# Use -F to prevent daemonizing the php-fpm
php-fpm81 -y /etc/php/8.1/fpm/php-fpm.conf -F