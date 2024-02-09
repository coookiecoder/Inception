sed -i "s/\$MYSQL_HOST/$MYSQL_HOST/g" /usr/local/init.sql
sed -i "s/\$MYSQL_BASE/$MYSQL_BASE/g" /usr/local/init.sql
sed -i "s/\$MYSQL_ANAME/$MYSQL_ANAME/g" /usr/local/init.sql
sed -i "s/\$MYSQL_APASS/$MYSQL_APASS/g" /usr/local/init.sql
sed -i "s/\$MYSQL_UNAME/$MYSQL_UNAME/g" /usr/local/init.sql
sed -i "s/\$MYSQL_UPASS/$MYSQL_UPASS/g" /usr/local/init.sql

if [ ! -d "/var/lib/mysql/inception" ]; then
	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm

	mysqld --user=mysql --bootstrap < /usr/local/init.sql
fi

sed -i "s|skip-networking|# skip-networking|g" /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/mysql/mariadb.conf.d/50-server.cnf

mysqld --user=mysql
