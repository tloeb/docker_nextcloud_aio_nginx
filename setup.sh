#!/bin/bash

# Read user input
read -p "Enter your domain: " domain_name

# Create dhparam.pem

curl -L https://ssl-config.mozilla.org/ffdhe2048.txt -o production/dhparam

# If nginx.conf is not present, create it
if [[ ! -f production/default.nginx.conf ]]; then
    echo "nginx.conf not found. Creating one..."
    jinja2 templates/default.nginx.conf.j2 -D DOMAIN=$domain_name > production/default.nginx.conf
else
    read -p "nginx.conf not found. Create one? (y/n): " response
    if [[ "$response" == "y" ]]; then
        jinja2 templates/default.nginx.conf.j2 -D DOMAIN=$domain_name > production/default.nginx.conf
    fi
fi
