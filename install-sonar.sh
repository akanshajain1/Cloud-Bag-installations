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
