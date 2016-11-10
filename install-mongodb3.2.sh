#!bin/bash
# installing Mongo DATABASE
# Configure mongodb.list file with the correct location
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
# Disable THP
# sudo echo never > /sys/kernel/mm/transparent_hugepage/enabled
# sudo echo never > /sys/kernel/mm/transparent_hugepage/defrag
# sudo grep -q -F 'transparent_hugepage=never' /etc/default/grub || echo 'transparent_hugepage=never' >> /etc/default/grub
# Install updates
sudo apt-get -y update
# Modified tcp keepalive according to https://docs.mongodb.org/ecosystem/platforms/windows-azure/
#sudo bash -c "sudo echo net.ipv4.tcp_keepalive_time = 120 >> /etc/sysctl.conf"
#Install Mongo DB
sudo apt-get install -y mongodb-org
