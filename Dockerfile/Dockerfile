FROM ubuntu:18.04

# Maintainer
MAINTAINER Nathan "nathanfeitoza@outlook.com.br"

ENV NGINX_VERSION 1.9.3-1~jessie

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y software-properties-common && add-apt-repository ppa:ondrej/php && apt-get update && apt-get install -y nginx php7.3-fpm curl git && apt-get clean

RUN apt-get install -y php7.3-zip php7.3-sqlite3 php7.3-xml php7.3-xmlrpc php7.3-pgsql php7.3-odbc php7.3-mysql php7.3-mbstring php7.3-json php7.3-gd php7.3-soap php7.3-dba php7.3-curl php7.3-bz2 php7.3-bcmath
# NGINX
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log
VOLUME ["/var/cache/nginx"]
RUN rm /etc/nginx/sites-available/default
ADD ./default /etc/nginx/sites-available/default

# COMPOSER
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && php composer-setup.php && rm composer-setup.php && mv composer.phar /usr/local/bin/composer && chmod a+x /usr/local/bin/composer
ENV COMPOSER_ALLOW_SUPERUSER 1

# BUILD
WORKDIR /var/www/html-nginx

EXPOSE 80 443
CMD service php7.3-fpm start && nginx -g "daemon off;"