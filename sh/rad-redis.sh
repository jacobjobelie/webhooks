#!/usr/bin/env bash

REPO='git@github.com:jacobjobelie/rad-redis.git';
RELEASE="/home/samradelie/www/rad/rad-redis/";

# Fetch Latest Code
pm2 stop rad-redis
pm2 delete rad-redis
if [ -d "$RELEASE" ]; then
  cd $RELEASE
  git pull origin master
else
  git clone -b master $REPO $RELEASE;
fi
cd $RELEASE
npm i
pm2 start live.js --name rad-redis -f