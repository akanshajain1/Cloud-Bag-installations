wget http://mirrors.ibiblio.org/apache/tomcat/tomcat-8/v8.5.9/bin/apache-tomcat-8.5.9.tar.gz
tar xvzf apache-tomcat-8.5.9.tar.gz
mv apache-tomcat-8.5.9 /opt/tomcat
mkdir /opt/java
cd /opt/java
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.tar.gz"
tar -zxvf jdk-8u45-linux-x64.tar.gz
cd jdk1.8.0_45/
export JAVA_HOME=/opt/java/jdk1.8.0_45/
export JRE_HOME=/opt/java/jdk1.8.0_45/jre
export CATALINA_HOME=/opt/tomcat
export PATH=$PATH:/opt/java/jdk1.8.0_45/bin:/opt/java/jdk1.8.0_45/jre/bin:/opt/tomcat
cd
$CATALINA_HOME/bin/startup.sh
