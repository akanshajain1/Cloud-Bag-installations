# sudo su
/usr/bin/apt-get update -y
wget -qO- https://get.docker.com/ | sh
docker run --name mysql -e MYSQL_ROOT_PASSWORD=welcome123 -d mysql
