#!/usr/bin/env bash

REPO='git@github.com:samelie/rad.wtf.git';
RELEASE_DIR='/home/samelie/webhooks/r';
APP_DIR='/var/www/rad.wtf/html/www/webhooks/';
RELEASE="/var/www/rad.wtf/html/www/rad.wtf/www/";

# Fetch Latest Code
[ -d $RELEASE_DIR ] || mkdir -p $RELEASE_DIR;
cd $RELEASE_DIR;
git clone -b master $REPO $RELEASE;