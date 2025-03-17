# Overview

This project is a simple nextcoud AIO deployment using docker-compose. It is intended to be used for development and testing purposes only. As proxy server, it uses the official nginx image.

# Setup and Configuration

Public ressources:
- [Nextcloud](https://nextcloud.com/)
- [Nextcloud Proxy Documentation](https://github.com/nextcloud/all-in-one/blob/main/reverse-proxy.md)
- [Installation Example](https://github.com/nextcloud/all-in-one/discussions/588#discussioncomment-2811152)

## Prerequisites

- Docker
- Docker Compose
- A domain name pointing to your server
- jinja2-cli
- (optional) A valid SSL certificate

### Install jinja2-cli

```bash
pip3 install jinja2-cli[yaml] --break-system-packages

# Generate nginx configuration
jinja2 nginx.conf.j2 config.yaml > nginx.conf
```

## Quickstart

```bash

'''bash
# Optional retrieve a certificate
sudo certbot certonly --nginx

# Generate nginx configuration
./setup.sh

docker-compose up -d
```


# Overwrite the existing config

'''bash
rm production nginx.conf
./setup.sh
'''

# Let's Encrypt

## Install Certbot

```bash
sudo apt-get update
sudo apt-get install certbot
```

## Retrieve a Certificate

```bash
sudo certbot certonly --nginx
```

## Test automatic renewal

The Certbot packages on your system come with a cron job or systemd timer that will renew your certificates automatically before they expire. You will not need to run Certbot again, unless you change your configuration. You can test automatic renewal for your certificates by running this command:

sudo certbot renew --dry-run
The command to renew certbot is installed in one of the following locations:

/etc/crontab/
/etc/cron.*/*
systemctl list-timers

