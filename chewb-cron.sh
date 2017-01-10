#!/usr/bin/env bash

REPO='git@github.com:jacobjobelie/chewb-cron.git';
RELEASE="/home/samradelie/crons/chewb-cron";

# Fetch Latest Code
pm2 stop chewb-cron
rm -R $RELEASE
git clone -b master $REPO $RELEASE;
cd $RELEASE
npm i
pm2 start index.js --name chewb-cron -f