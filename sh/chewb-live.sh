#!/usr/bin/env bash

REPO='git@github.com:jacobjobelie/chewb-live.git';
RELEASE="/var/www/rad.wtf/html/www/chewb-live/";

# Fetch Latest Code
pm2 stop chewb-live
pm2 delete chewb-live
mkdir -p $RELEASE
rm -rf $RELEASE
if [ -d "$RELEASE" ]; then
  mkdir -p $RELEASE
  cd $RELEASE
  git pull origin master
else
  git clone -b master $REPO $RELEASE;
fi
cd $RELEASE
npm i
pm2 start index.js --name chewb-live -f
exit