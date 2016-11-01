# sudo su
/usr/bin/apt-get update -y
wget -qO- https://get.docker.com/ | sh
docker run -d --name artifactory -p 80:80 -p 8081:8081 -p 443:443  docker.bintray.io/jfrog/artifactory-oss
