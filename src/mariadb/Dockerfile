FROM debian:stable

RUN apt-get -y upgrade && apt-get -y update && apt-get install -y mariadb-server mariadb-client

COPY init.sql /usr/local
COPY run.sh /usr/local/bin

RUN chmod 707 /usr/local/bin/run.sh

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld && chown -R mysql:mysql /var/lib/mysql

EXPOSE 3306
ENTRYPOINT [ "bash", "run.sh" ]
