#!/usr/bin/env bash

REPO='git@github.com:jacobjobelie/alhambra-web.git';
RELEASE="/home/samradelie/www/rad/alhambra-web/";

# Fetch Latest Code
if [ -d "$RELEASE" ]; then
  cd $RELEASE
  git pull origin desktop
else
  git clone -b desktop $REPO $RELEASE;
fi
cd $RELEASE
