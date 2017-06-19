#!/bin/sh
set -e

cd /mnt
git clone --bare $ORIGIN_URL
cd *
git remote add --mirror=push mirror $MIRROR_URL
git fetch mirror

crond -f
