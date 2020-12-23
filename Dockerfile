FROM php:7.3-apache
#Install git
RUN apt-get update && apt-get install -y git
RUN docker-php-ext-install pdo pdo_mysql mysqli
RUN a2enmod rewrite
#Install Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --install-dir=. --filename=composer
RUN mv composer /usr/local/bin/
COPY . /var/www/html/
#RUN chgrp -R 0 /usr/local && chmod -R g=u /usr/local
#RUN sed -i 's/Listen 80/Listen 8080/' /usr/local/apache2/conf/httpd.conf
EXPOSE 80
