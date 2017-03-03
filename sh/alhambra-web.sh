#!/usr/bin/env bash

REPO='git@github.com:jacojobelie/alhambra-web.git';
RELEASE="/home/samradelie/www/rad/alhambra-web/";

# Fetch Latest Code
pm2 stop alhambra-web
pm2 delete alhambra-web
if [ -d "$RELEASE" ]; then
  cd $RELEASE
  git pull origin master
else
  git clone -b master $REPO $RELEASE;
fi
cd $RELEASE
npm i
