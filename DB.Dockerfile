# Use the official MySQL image from Docker Hub
FROM mysql:latest

# Environment variables
ENV MYSQL_ROOT_PASSWORD=
ENV MYSQL_DATABASE=
ENV MYSQL_USER=
ENV MYSQL_PASSWORD=

# Copy SQL script to initialize database
COPY ./newdb.sql /docker-entrypoint-initdb.d/

# Expose the MySQL port
EXPOSE 3306

# Use ENTRYPOINT to set the entrypoint script
ENTRYPOINT ["docker-entrypoint.sh"]

# Specify CMD to start MySQL server
CMD ["mysqld"]
