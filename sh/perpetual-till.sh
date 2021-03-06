#!/usr/bin/env bash

REPO='git@github.com:samelie/perpetual-till.git';
RELEASE="/var/www/rad.wtf/html/www/rad/perpetual-till/";

# Fetch Latest Code
pm2 stop perpetual-till
pm2 delete perpetual-till
rm -rf $RELEASE
if [ -d "$RELEASE" ]; then
  cd $RELEASE
  git pull origin master
else
  git clone -b master $REPO $RELEASE;
fi
cd $RELEASE
npm i
pm2 start index.js --name perpetual-till -f
exit