sudo apt-get update
sudo apt-get install nginx
wget https://github.com/DevOps-Mindtree/Cloud-Bag-installations/blob/master/nginxconfig.sh
sudo chmod 755 nginxconfig.sh
./nginxconfig.sh
sudo service nginx restart
