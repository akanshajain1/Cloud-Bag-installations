sudo su
/usr/bin/apt-get update -y
wget -qO- https://get.docker.com/ | sh
docker run --name jenkins  -p 8080:8080  jenkins --prefix=/jenkins
docker run --name mysql -e MYSQL_ROOT_PASSWORD=welcome123 -d mysql
docker run --name sonar -d -p 9000:9000 sonarqube --link mysql:db sonarqube
