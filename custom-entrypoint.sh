
#!/bin/bash
set -e

# Start MySQL
/usr/local/bin/docker-entrypoint.sh mysqld &
mysql_pid=$!

# Wait for MySQL to start
until mysqladmin ping &>/dev/null; do
    echo "Waiting for MySQL to start..."
    sleep 1
done

# Disable foreign key checks
mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "SET foreign_key_checks = 0;"

# Import the database
mysql -uroot -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE" < /docker-entrypoint-initdb.d/database.sql

# Enable foreign key checks
mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "SET foreign_key_checks = 1;"

# Wait for MySQL to finish initialization
wait $mysql_pid
