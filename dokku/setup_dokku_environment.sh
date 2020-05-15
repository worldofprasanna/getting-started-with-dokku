#!/bin/bash

set -e

# Setup swap space
fallocate -l 2G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo "/swapfile none swap sw 0 0" >> /etc/fstab

APP_NAME=awesome_app
DB_NAME=awesome_app_production

# Create the App
dokku apps:create $APP_NAME

# Setup the postgres database
dokku plugin:install https://github.com/dokku/dokku-postgres.git postgres
dokku postgres:create $DB_NAME
dokku postgres:link $DB_NAME $APP_NAME

# Setup env variables
dokku config:set $(cat .env)

# Setup Letsencrypt
dokku plugin:install https://github.com/dokku/dokku-letsencrypt.git
dokku config:set --no-restart DOKKU_LETSENCRYPT_EMAIL=prasannacse2005@gmail.com
dokku letsencrypt $APP_NAME
dokku letsencrypt:cron-job --add
