#!/usr/bin/env bash

REPO='git@github.com:samradical/british-pate.git';
RELEASE_DIR='/home/samradical/webhooks/r';
APP_DIR='/home/samradelie/webhooks/';
RELEASE="/home/samradelie/www/rad/british-pate/";

# Fetch Latest Code
[ -d $RELEASE_DIR ] || mkdir $RELEASE_DIR;
cd $RELEASE_DIR;
git clone -b master $REPO $RELEASE;
