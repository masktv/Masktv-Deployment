#choose base image of ubuntu
FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install apache2 -y 

# Add file which contain sites setting 
COPY ./domain.conf /etc/apache2/sites-available/domain.conf
RUN  ln -s /etc/apache2/sites-available/domain.conf /etc/apache2/sites-enabled/domain.conf && \
     rm /etc/apache2/sites-enabled/000-default.conf && \
     systemctl reload apache2

#Add package or dependencies thats needs to install php
RUN apt-get update && \
    apt-get install -y software-properties-common gnup && \
    echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu focal main" > /etc/apt/sources.list.d/ondrej-php.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E5267A6C && \
    apt-get update && \
    apt-get install -y php7.4 php7.4-mysql php7.4-cli php7.4-common php7.4-json php7.4-zip php7.4-gd php7.4-mbstring && \
    apt-get install php7.4 libapache2-mod-php7.4 && \
    apt install phpmyadmin -y && \  
    a2enmod php7.4
RUN systemctl restart apache2
#Give permission to php user to write 
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html && \
    a2enmod rewrite 

#Expose application on port 80
EXPOSE 80

# Start apache in foreground mode 
CMD ["apachectl","-D","FOREGROUND"]
