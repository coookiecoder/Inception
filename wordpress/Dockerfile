FROM debian:stable

RUN apt-get -y upgrade && apt-get -y update && apt-get install -y php-8.1 php-common && apt-get install -y mariadb-client wget

COPY php-fpm.conf /etc/php/7.3/fpm/
COPY www.conf /etc/php/7.3/fpm/pool.d/
COPY start.sh /usr/local/bin

RUN mkdir -p /var/www/html && chown -R www-data:www-data /var/www/html && userdel -f www-data && useradd -u 82 www-data

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000
WORKDIR /var/www/html/wordpress
ENTRYPOINT [ "start.sh" ]
