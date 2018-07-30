#!/bin/sh -eu

sudo apt-get update >/dev/null

### INSTALL DOCKER
if [ $(which docker >/dev/null; echo $?) -eq 0 ]
then
	echo "Docker already installed"
else
	echo "Installing docker"
	sudo apt-get -y install apt-transport-https
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo apt-key fingerprint 0EBFCD88
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
	sudo apt-get update
	sudo apt-get install -y docker-ce
	sudo usermod -aG docker $USER
	echo "Docker successfully installed"
	echo "Exiting... please log in and rerun this script. This reloads your user groups and is unavoidable :("
	sleep 3
	exit
fi

# INSTALL DOCKER COMPOSE
if [ $(which docker-compose >/dev/null; echo $?) -eq 0 ]
then
	echo "Docker Compose already installed"
else
	echo "Installing docker compose"
	sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose
	docker-compose --version
	echo "Docker compose successfully installed"
fi

### RUN EXPLORER NODE
# if we can't set the permissions, don't worry about it
mkdir -p /cardano && chmod -R 777 /cardano 2>/dev/null || true
# set up a crontab to restart all containers because the explorer is unreliable
echo '0 */6 * * * docker restart -t 0 $(docker ps -aq)' | crontab -
# (re)start the services
docker-compose down 2>/dev/null && docker-compose up -d
