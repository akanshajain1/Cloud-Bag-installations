/usr/bin/apt-get update -y
wget -qO- https://get.docker.com/ | sh
docker run --name sonar -d -p 9000:9000 sonarqube
