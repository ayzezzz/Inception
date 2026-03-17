#!/bin/bash
set -e

if [ -f /run/secrets/db_password ]; then
    MYSQL_PASSWORD=$(cat /run/secrets/db_password)
fi

if [ -f /run/secrets/db_root_password ]; then
    MYSQL_ROOT_PASSWORD=$(cat /run/secrets/db_root_password)
fi

if [ ! -d "/var/lib/mysql/${MYSQL_DATABASE}" ]; then
    echo "Initializing MariaDB..."
    
    mysql_install_db --user=mysql --datadir=/var/lib/mysql

    mysqld --user=mysql --bootstrap << EOF
USE mysql;
FLUSH PRIVILEGES;

ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';

CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';

FLUSH PRIVILEGES;
EOF
    echo "Database initialized!"
fi

echo "Starting MariaDB daemon..."
exec mysqld --user=mysql --console --skip-networking=0 --bind-address=0.0.0.0