#!/bin/sh
set -e

cd /mnt
git clone --bare $ORIGIN_URL
cd *
git remote add mirror $MIRROR_URL

# Initial run
/etc/periodic/15min/sync.sh

crond -f
