#!/usr/bin/env bash

REPO='git@github.com:jacobjobelie/webhooks.git';
RELEASE="/home/samradelie/webhooks/";

# Fetch Latest Code
pm2 stop webhooks
pm2 delete webhooks
if [ -d "$RELEASE" ]; then
  git checkout webhooks.sh
  git pull origin master
else
  git clone -b master $REPO $RELEASE;
fi
cd $RELEASE
npm i
chmod +x webhooks.sh
pm2 start index.js --name webhooks
