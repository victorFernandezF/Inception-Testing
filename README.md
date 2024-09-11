# Inception

docker project

# Add Docker's official GPG key:

sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:

echo \
 "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
 $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
 sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo docker run hello-world

## utils

docker-compose down --rmi all && docker-compose down --remove-orphans
docker-compose up --build

docker-compose up -d
docker-compose exec mariadb /bin/bash

# INSTALL

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

Next, set the correct permissions so that the docker-compose command is executable:

sudo chmod +x /usr/local/bin/docker-compose
To verify that the installation was successful, you can run:

docker-compose --version
You’ll see output similar to this:

Output
docker-compose version 1.29.2, build 5becea4c
