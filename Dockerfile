FROM ubuntu:bionic
RUN apt-get update --fix-missing
RUN apt-get install -y nginx php-fpm php-mysql curl mysql-client
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf
RUN sed -i -e "s/;\?daemonize\s*=\s*yes/daemonize = no/g" /etc/php/7.2/fpm/php-fpm.conf
#COPY FILE
COPY . /var/www/html/
COPY ./www.conf /etc/php/7.2/fpm/pool.d/
# Nginx config
RUN rm /etc/nginx/sites-enabled/default
ADD ./pesbuk.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/pesbuk.conf /etc/nginx/sites-enabled/pesbuk.conf
# Expose ports.
EXPOSE 80
# RUN PHP and NGINX
CMD service php7.2-fpm start && nginx
