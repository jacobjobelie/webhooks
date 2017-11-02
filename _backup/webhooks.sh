#!/usr/bin/env bash

REPO='git@github.com:jacobjobelie/webhooks.git';
RELEASE="/var/www/rad.wtf/webhooks/";

# Fetch Latest Code
pm2 stop webhooks
pm2 delete webhooks
rm -rf $RELEASE
git clone -b master $REPO $RELEASE;
cd $RELEASE
npm i
pm2 start index.js --name webhooks -f
exit