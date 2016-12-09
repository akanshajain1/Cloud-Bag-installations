#!/bin/bash
sudo apt-get update
sudo apt-get install nginx -y
sudo wget https://raw.githubusercontent.com/DevOps-Mindtree/Cloud-Bag-installations/master/nginxconfigscript.sh?_sm_au_=iRVkD8DPLjJBMnRq
sudo mv nginxconfigscript.sh?_sm_au_=iRVkD8DPLjJBMnRq nginxconfigscript.sh
sudo chmod 755 nginxconfigscript.sh
sudo sh nginxconfigscript.sh $1
sudo service nginx restart
