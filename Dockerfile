FROM docker.io/httpd

COPY ./*.php /usr/local/apache2/htdocs/

COPY ./*.html /usr/local/apache2/htdocs/

RUN chgrp -R 0 /usr/local && chmod -R g=u /usr/local

RUN sed -i 's/Listen 80/Listen 8080/' /usr/local/apache2/conf/httpd.conf
