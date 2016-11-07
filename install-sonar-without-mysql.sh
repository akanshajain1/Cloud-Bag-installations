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
echo "sonar.web.context=/sonar" >> /opt/sonar/sonar/conf/sonar.properties
/opt/sonar/sonar/bin/linux-x86-64/sonar.sh start
