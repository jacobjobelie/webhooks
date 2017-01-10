#!/usr/bin/env bash

REPO='git@github.com:jacobjobelie/webhooks.git';
RELEASE="/home/samradelie/webhooks/";

# Fetch Latest Code
pm2 stop webhooks
pm2 delete webhooks
if [ -d "$RELEASE" ]; then
  git pull origin master
else
  git clone -b master $REPO $RELEASE;
fi
cd $RELEASE
npm i
pm2 start index.js --name webhooks
