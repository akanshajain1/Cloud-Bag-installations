/usr/bin/apt-get update -y
mkdir /opt/jenkins && cd /opt/jenkins
wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
/usr/bin/apt-get update -y
/usr/bin/add-apt-repository ppa:openjdk-r/ppa
/usr/bin/apt-get update -y
/usr/bin/apt-get install openjdk-8-jdk -y
/usr/bin/apt-get install jenkins -y
service jenkins start
sed -i '$d' /etc/default/jenkins
echo 'JENKINS_ARGS="--webroot=/var/cache/$NAME/war --httpPort=$HTTP_PORT --prefix=/jenkins"' >> /etc/default/jenkins
service jenkins restart
