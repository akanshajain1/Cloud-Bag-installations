#!bin/bash
sudo su
/usr/bin/apt-get update -y
wget -qO- https://get.docker.com/ | sh
docker run --name jenkins  -p 8080:8080  jenkins --prefix=/jenkins
export DEBIAN_FRONTEND=noninteractive
echo mysql-server-5.6 mysql-server/root_password password welcome123 | debconf-set-selections
echo mysql-server-5.6 mysql-server/root_password_again password welcome123 | debconf-set-selections
# install the LAMP stack
apt-get -y install mysql-server-5.6 
sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
sudo service mysql restart
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'welcome123'; flush privileges;" | mysql -u root -pwelcome123
echo "CREATE DATABASE sonar CHARACTER SET utf8 COLLATE utf8_general_ci; CREATE USER 'sonar' IDENTIFIED BY 'sonar';GRANT ALL PRIVILEGES ON sonar.* TO 'sonar'@'%' IDENTIFIED BY 'sonar'; GRANT ALL ON sonar.* TO 'sonar'@'localhost' IDENTIFIED BY 'sonar'; flush privileges;" | mysql -u root -pwelcome123
docker run --name sonar -d -p 9000:9000 -e DB_USER=sonar -e DB_PWD=sonar -e DB_URL=10.0.3.6 -e DB_PORT=3306  preetick/sonar-devops:v18
apt-get update
IP_ADDR=sh curl ipecho.net/plain
docker run --name nginx_devops -d -p 80:80 -e NGINX_ADDR=IP_ADDR -e JENKINS_ADDR=IP_ADDR -e SONAR_ADDR=IP_ADDR preetick/nginx-devops:v13
