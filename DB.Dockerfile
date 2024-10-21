FROM mysql:latest

RUN mkdir -p /etc/mysql/conf.d

# Copy statefulset replication configuration file 
COPY ./custom-mysql.cnf /etc/mysql/conf.d/custom-mysql.cnf

# Expose the MySQL port
EXPOSE 3306

# Use ENTRYPOINT to set the entrypoint script
#if contaner getting restart or dsplay error, run with uncomment below line
#ENTRYPOINT ["docker-entrypoint.sh"]

# Specify CMD to start MySQL server
CMD ["mysqld"]
