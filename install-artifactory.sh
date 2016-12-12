#sudo su
/usr/bin/apt-get update -y 
add-apt-repository ppa:openjdk-r/ppa 
apt-get update -y 
apt-get install openjdk-8-jdk -y 
apt-get install unzip -y  
cd /opt 
wget https://dl.bintray.com/jfrog/artifactory/jfrog-artifactory-oss-4.14.0.zip  
unzip jfrog-artifactory-oss-4.14.0.zip  
cd /opt/artifactory-oss-4.14.0/bin 
./installService.sh 
echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/" >> /etc/opt/jfrog/artifactory/default 
#sed -i -e 's/8081/8080/' /opt/artifactory-oss-4.14.0/tomcat/conf/server.xml 
service artifactory check 
service artifactory start
