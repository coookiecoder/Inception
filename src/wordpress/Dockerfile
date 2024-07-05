FROM debian:stable

RUN apt-get -y upgrade && apt-get -y update && apt-get install -y php8.2 php8.2-fpm php-common php8.2-mysql php8.2-gd php8.2-mbstring php8.2-zip && apt-get install -y mariadb-client wget

COPY php-fpm.conf /etc/php/8.2/fpm/
COPY www.conf /etc/php/8.2/fpm/pool.d/
COPY run.sh /usr/local/bin

RUN chmod 707 /usr/local/bin/run.sh

RUN mkdir -p /var/www/html && chown -R www-data:www-data /var/www/html && userdel -f www-data && useradd -u 82 www-data

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000
WORKDIR /var/www/html/wordpress
ENTRYPOINT [ "bash", "run.sh" ]
