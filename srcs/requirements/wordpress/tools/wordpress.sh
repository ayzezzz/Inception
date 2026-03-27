#!/bin/bash
set -e

until mysqladmin ping -h"mariadb" -u root -p"${MYSQL_ROOT_PASSWORD}" --silent; do
    echo "Waiting for MariaDB..."
    sleep 2
done

cd /var/www/html

if [ ! -f wp-config.php ]; then
    echo "Downloading WordPress..."
    wp core download --allow-root --force

    echo "Creating wp-config.php..."
    wp config create --allow-root \
        --dbname="${MYSQL_DATABASE}" \
        --dbuser="${MYSQL_USER}" \
        --dbpass="${MYSQL_PASSWORD}" \
        --dbhost="${MYSQL_HOST}" \
        --path=/var/www/html

    echo "Installing WordPress..."
    wp core install --allow-root \
        --url="https://${DOMAIN_NAME}" \
        --title="${WP_TITLE}" \
        --admin_user="${WP_ADMIN_USER}" \
        --admin_password="${WP_ADMIN_PASSWORD}" \
        --admin_email="${WP_ADMIN_EMAIL}"

    echo "Creating second user..."
    wp user create --allow-root \
        "${WP_USER}" "${WP_USER_EMAIL}" \
        --role=editor \
        --user_pass="${WP_USER_PASSWORD}"
fi

echo "Setting permissions..."
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

echo "Starting PHP-FPM..."
exec php-fpm8.2 -F