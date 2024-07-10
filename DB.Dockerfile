#Create Dockerfile for MySQL

#Use the official MySQL 8.0 image from Docker Hub
FROM mysql:8.0

# Environment variables
ENV MYSQL_DATABASE=mydatabase
ENV MYSQL_USER=myuser
ENV MYSQL_PASSWORD=mypassword
ENV MYSQL_ROOT_PASSWORD=myrootpassword

# Create database.
# Insert database in it from github pwd to database.

