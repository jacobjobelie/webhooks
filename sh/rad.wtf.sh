#!/usr/bin/env bash

REPO='git@github.com:samelie/rad.wtf.git';
RELEASE_DIR='/home/samelie/webhooks/r';
APP_DIR='/home/samradelie/webhooks/';
RELEASE="/home/samradelie/www/rad.wtf/www/";

# Fetch Latest Code
[ -d $RELEASE_DIR ] || mkdir $RELEASE_DIR;
cd $RELEASE_DIR;
git clone -b master $REPO $RELEASE;