# sudo su
/usr/bin/apt-get update -y
wget -qO- https://get.docker.com/ | sh
docker run --name mongodb -d mongo
