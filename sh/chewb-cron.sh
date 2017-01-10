#!/usr/bin/env bash

REPO='git@github.com:jacobjobelie/chewb-cron.git';
RELEASE="/home/samradelie/crons/chewb-cron/";

# Fetch Latest Code
pm2 stop chewb-cron
pm2 delete chewb-cron
if [ -d "$RELEASE" ]; then
  cd $RELEASE
  git pull origin master
else
  git clone -b master $REPO $RELEASE;
fi
cd $RELEASE
npm i
pm2 start index.js --name chewb-cron -f