#!/usr/bin/env bash

REPO='git@github.com:jacobjobelie/webhooks.git';
RELEASE="/home/samradelie/webhooks/custom";

# Fetch Latest Code
pm2 stop webhooks
rm -R $RELEASE
git clone -b master $REPO $RELEASE;
cd $RELEASE
pm2 start index.js --name webhooks
