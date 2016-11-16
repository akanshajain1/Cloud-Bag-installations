sudo /usr/bin/apt-get update -y
wget -qO- https://get.docker.com/ | sh
sudo docker run --name mongodb -d mongo
