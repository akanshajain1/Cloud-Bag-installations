sudo touch /etc/nginx/conf.d/devtools.conf
sudo echo "server { listen 80; client_max_body_size 20M; server_name  devopsformyorg.southeastasia.cloudapp.azure.com;" >> /etc/nginx/conf.d/devtools.conf
sudo echo "proxy_pass http://10.0.2.8:8080; }" >> /etc/nginx/conf.d/devtools.conf
sudo echo "location /sonar {proxy_pass http://10.0.2.7:9000;}}" >> /etc/nginx/conf.d/devtools.conf
sudo sed -i -e"s/# server_names_hash_bucket_size.*/server_names_hash_bucket_size 128;/" /etc/nginx/nginx.conf
