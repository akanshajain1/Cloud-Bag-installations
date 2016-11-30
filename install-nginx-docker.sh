#!/bin/bash
apt-get update
wget -qO- https://get.docker.com/ | sh
IP_ADDR=sh curl ipecho.net/plain
sudo docker run --name nginx_devops -d -p 80:80 -e NGINX_ADDR=$IP_ADDR -e JENKINS_ADDR=$IP_ADDR -e SONAR_ADDR=$IP_ADDR preetick/nginx-devops:v13

