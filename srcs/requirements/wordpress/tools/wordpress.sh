#!/bin/bash
set -e

DB_PWD=$(cat /run/secrets/db_password)
DB_ROOT_PWD=$(cat /run/secrets/db_root_password)
ADMIN_PWD=$(cat /run/secrets/wp_admin_password)
USER_PWD=$(cat /run/secrets/wp_user_password)

until mysqladmin ping -h"mariadb" -u root -p"${DB_ROOT_PWD}" --silent; do
    echo "Waiting for MariaDB..."
    sleep 2
done

cd /var/www/html

if [ ! -f wp-config.php ]; then
    echo "Downloading WordPress..."
    wp core download --allow-root --path=/var/www/html --force

    echo "Creating wp-config.php..."
    wp config create --allow-root \
        --dbname="${MYSQL_DATABASE}" \
        --dbuser="${MYSQL_USER}" \
        --dbpass="${DB_PWD}" \
        --dbhost=mariadb \
        --path=/var/www/html

    echo "Installing WordPress..."
    wp core install --allow-root \
        --url="https://${DOMAIN_NAME}" \
        --title="${WP_TITLE}" \
        --admin_user="${WP_ADMIN_USER}" \
        --admin_password="${ADMIN_PWD}" \
        --admin_email="${WP_ADMIN_EMAIL}"

    echo "Creating second user..."
    wp user create --allow-root \
        "${WP_USER}" "${WP_USER_EMAIL}" \
        --role=author \
        --user_pass="${USER_PWD}"
fi

chown -R www-data:www-data /var/www/html

echo "Starting PHP-FPM..."
exec php-fpm8.2 -F