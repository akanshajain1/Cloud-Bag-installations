sudo /usr/bin/apt-get update -y
wget -qO- https://get.docker.com/ | sh
sudo docker run -d -p 3306:3306 -p 9000:9000 --name sonar-mysql devopsmt/sonar6.0-mysql5.6
