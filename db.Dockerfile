# Use the official MySQL image from Docker Hub
FROM mysql:latest

# I used env variable in db.deployment and app.deployment from secreats, then will have to mention value of env here in decoded form?????

# Environment variables
ENV MYSQL_ROOT_PASSWORD=Masktv@123
ENV MYSQL_DATABASE=new_db
ENV MYSQL_USER=new_user
ENV MYSQL_PASSWORD=satara@123

# Copy SQL script to initialize database
COPY ./newdb.sql /docker-entrypoint-initdb.d/

# Expose the MySQL port
EXPOSE 3306

# Use ENTRYPOINT to set the entrypoint script
ENTRYPOINT ["docker-entrypoint.sh"]

# Specify CMD to start MySQL server
CMD ["mysqld"]
