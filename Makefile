all: addhost
	sudo docker-compose -f docker-compose.yml up --build

stop:
	sudo docker-compose -f docker-compose.yml down

clean_data:
	sudo rm -rf /home/abareux/data/database/*
	sudo rm -rf /home/abareux/data/website/*
	sudo rm -rf /home/abareux/data/logs/*

addhost:
	sudo chmod 777 /etc/hosts
	sudo echo "127.0.0.1 abareux.42.fr" >> /etc/hosts
	sudo echo "127.0.0.1 www.abareux.42.fr" >> /etc/hosts

.PHONY: all stop clean_data addhost
