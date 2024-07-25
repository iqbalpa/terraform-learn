#!/bin/bash

sudo apt-get update
sudo apt-get install -y nginx
sudo systemctl start nginx

cat > /etc/nginx/sites-available/default <<- EOM
server {
    listen 80;
    server_name _;

    location / {
        proxy_pass http://localhost:3000;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}
EOM

nginx -t
systemctl reload nginx
