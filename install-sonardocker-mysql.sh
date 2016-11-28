/usr/bin/apt-get update -y
wget -qO- https://get.docker.com/ | sh
docker run --name sonar1 -d -p 9000:9000 -e DB_USER=sonar -e DB_PWD=sonar -e DB_URL=10.0.3.6 -e DB_PORT=3306  preetick/sonar-devops:v18


