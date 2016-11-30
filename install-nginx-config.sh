sudo apt-get update
sudo apt-get install nginx
sudo cd /etc/nginx/conf.d
echo "server { listen 80; client_max_body_size 20M; server_name  devopsformyorg.southeastasia.cloudapp.azure.com;" >> /etc/nginx/conf.d/devtools.conf
echo "location /jenkins { proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for; proxy_set_header Host $http_host;" >> /etc/nginx/conf.d/devtools.conf
echo "proxy_redirect off; proxy_pass http://10.0.2.8:8080; }" >> /etc/nginx/conf.d/devtools.conf
echo "location /sonar {proxy_pass http://10.0.2.7:9000;}" >> /etc/nginx/conf.d/devtools.conf
sudo service nginx restart
