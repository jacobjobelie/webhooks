#!/usr/bin/env bash

REPO='git@github.com:samelie/alhambra-desktop.git';
RELEASE="/home/samradelie/www/rad/alhambra-desktop/";

# Fetch Latest Code
pm2 stop alhambra-desktop
pm2 delete alhambra-desktop
if [ -d "$RELEASE" ]; then
  cd $RELEASE
  git pull origin master
else
  git clone -b master $REPO $RELEASE;
fi
cd $RELEASE
