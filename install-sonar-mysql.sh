#!/bin/bash
apt-get update

# set up a silent install of MySQL

export DEBIAN_FRONTEND=noninteractive
echo mysql-server-5.6 mysql-server/root_password password welcome123 | debconf-set-selections
echo mysql-server-5.6 mysql-server/root_password_again password welcome123 | debconf-set-selections

# install the LAMP stack
apt-get -y install mysql-server-5.6 

sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

sudo service mysql restart
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'welcome123'; flush privileges;" | mysql -u root -pwelcome123

echo "CREATE DATABASE sonar CHARACTER SET utf8 COLLATE utf8_general_ci; CREATE USER 'sonar' IDENTIFIED BY 'sonar';GRANT ALL PRIVILEGES ON sonar.* TO 'sonar'@'%' IDENTIFIED BY 'sonar'; GRANT ALL ON sonar.* TO 'sonar'@'localhost' IDENTIFIED BY 'sonar'; flush privileges;" | mysql -u root -pwelcome123

/usr/bin/apt-get update -y
/usr/bin/add-apt-repository ppa:openjdk-r/ppa
/usr/bin/apt-get update -y
/usr/bin/apt-get install openjdk-8-jdk -y
mkdir /opt/sonar && cd /opt/sonar
wget https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-6.0.zip
/usr/bin/apt-get install unzip
unzip sonarqube-6.0.zip
ln -s sonarqube-6.0 sonar
echo " " >> /opt/sonar/sonar/conf/sonar.properties
echo "sonar.jdbc.username=sonar" >> /opt/sonar/sonar/conf/sonar.properties
echo "sonar.jdbc.password=sonar" >> /opt/sonar/sonar/conf/sonar.properties
echo "sonar.web.context=/sonar" >> /opt/sonar/sonar/conf/sonar.properties
echo "sonar.jdbc.url=jdbc:mysql://localhost:3306/sonar?useUnicode=true&characterEncoding=utf8&rewriteBatchedStatements=true&useConfigs=maxPerformance" >> /opt/sonar/sonar/conf/sonar.properties 
/opt/sonar/sonar/bin/linux-x86-64/sonar.sh start
