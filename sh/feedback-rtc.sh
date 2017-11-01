#!/usr/bin/env bash

REPO='git@github.com:samradical/feedback-rtc.git';
RELEASE="/home/Sam/NODE/";

# Fetch Latest Code
pm2 stop feedback-rtc
pm2 delete feedback-rtc
rm -rf $RELEASE
mkdir -p $RELEASE
if [ -d "$RELEASE" ]; then
  mkdir -p $RELEASE
  cd $RELEASE
  git pull origin master
else
  git clone -b master $REPO $RELEASE;
fi
cd $RELEASE
npm i
pm2 start index.js --name feedback-rtc -f