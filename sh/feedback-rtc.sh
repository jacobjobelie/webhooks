#!/usr/bin/env bash

REPO='https://github.com/samradical/feedback-rtc.git';
RELEASE="/home/Sam/NODE/feedback-rtc/";

# Fetch Latest Code
pm2 stop feedback-rtc
pm2 delete feedback-rtc
rm -rf $RELEASE
git clone -b master $REPO $RELEASE;
cd $RELEASE
npm i
pm2 start index.js --name feedback-rtc -f
exit