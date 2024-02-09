FROM debian:stable

RUN apt-get -y upgrade && apt-get -y update && apt-get install -y nginx openssl

COPY nginx.conf /etc/nginx/conf.d/ssl.conf
COPY run.sh /usr/local/bin

RUN chmod 707 /usr/local/bin/run.sh

RUN openssl req -new -newkey rsa:2048 -nodes -keyout /etc/server.key -out /etc/server.csr -subj "/C=FR/ST=Alsace/L=Mulhouse/CN=abreux.42.fr" && openssl x509 -req -in /etc/server.csr -signkey /etc/server.key -out /etc/server.crt

EXPOSE 443
ENTRYPOINT [ "bash", "run.sh" ]
