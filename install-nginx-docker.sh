#!/bin/bash
apt-get update
wget -qO- https://get.docker.com/ | sh
#IP_ADDR=sh curl ipecho.net/plain
sudo docker run --name nginx_devops -d -p 80:80 -e NGINX_ADDR=$1.southeastasia.cloudapp.azure.com -e JENKINS_ADDR=$1.southeastasia.cloudapp.azure.com -e SONAR_ADDR=$1.southeastasia.cloudapp.azure.com preetick/nginx-devops:v13
