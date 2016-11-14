# sudo su
/usr/bin/apt-get update -y
wget -qO- https://get.docker.com/ | sh
sudo docker run --name jenkins  -p 8080:8080  jenkins --prefix=/jenkins
