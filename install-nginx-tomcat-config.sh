#!/bin/bash
sudo apt-get update
sudo apt-get install nginx -y
sudo wget https://raw.githubusercontent.com/DevOps-Mindtree/Cloud-Bag-installations/master/nginxtomcatconfig.sh?_sm_au_=ifVk6rZDjPQ0SSP5
sudo mv nginxtomcatconfig.sh?_sm_au_=ifVk6rZDjPQ0SSP5 nginxconfigscript.sh
sudo chmod 755 nginxconfigscript.sh
sudo sh nginxconfigscript.sh $1
sudo service nginx restart
