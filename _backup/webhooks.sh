#!/usr/bin/env bash

REPO='git@github.com:jacobjobelie/webhooks.git';
RELEASE="/var/www/rad.wtf/webhooks/";

# Fetch Latest Code
pm2 stop webhooks
pm2 delete webhooks
if [ -d "$RELEASE" ]; then
  cd $RELEASE
  git pull origin master
else
  git clone -b master $REPO $RELEASE;
fi
cd $RELEASE
npm i
pm2 start index.js --name webhooks -f
exit