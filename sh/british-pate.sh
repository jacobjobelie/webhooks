#!/usr/bin/env bash

REPO='git@github.com:samradical/british-pate.git';
RELEASE_DIR='/var/www/rad.wtf/html/webhooks/r';
APP_DIR='/var/www/rad.wtf/html/webhooks/';
RELEASE="/var/www/rad.wtf/html/www/rad/british-pate/";

# Fetch Latest Code
[ -d $RELEASE_DIR ] || mkdir $RELEASE_DIR;
cd $RELEASE_DIR;
git clone -b master $REPO $RELEASE;
