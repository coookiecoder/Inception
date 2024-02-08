sed -i "s/\$MYSSQL_HOST/$MYSQL_HOST/g" /usr/local/init.sql
sed -i "s/\$MYSSQL_BASE/$MYSQL_BASE/g" /usr/local/init.sql
sed -i "s/\$MYSSQL_ANAME/$MYSQL_ANAME/g" /usr/local/init.sql
sed -i "s/\$MYSSQL_APASS/$MYSQL_APASS/g" /usr/local/init.sql
sed -i "s/\$MYSSQL_UNAME/$MYSQL_UNAME/g" /usr/local/init.sql
sed -i "s/\$MYSSQL_UPASS/$MYSQL_UPASS/g" /usr/local/init.sql

if [ ! -d "/var/lib/mysql/mariadb" ]; then
	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null

	mysqld --user=mysql --bootstrap < /usr/local/init.sql
fi

sed -i "s|skip-networking|# skip-networking|g" /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/mysql/mariadb.conf.d/50-server.cnf

exec mysqld --user=mysql
