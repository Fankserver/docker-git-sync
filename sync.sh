#!/bin/sh
set -e

cd /mnt/*
if [ "$?" != "0" ]; then
  echo "ERROR: Repo does not exists"
  exit 1
fi
git fetch origin
if [ "$?" != "0" ]; then
  echo "ERROR: failed fetch from $ORIGIN_URL"
  exit 1
fi
git fetch origin --tags
if [ "$?" != "0" ]; then
  echo "ERROR: failed fetch from $ORIGIN_URL"
  exit 1
fi
git fetch mirror
if [ "$?" != "0" ]; then
  echo "ERROR: failed fetch from $MIRROR_URL"
  exit 1
fi
git fetch mirror --tags
if [ "$?" != "0" ]; then
  echo "ERROR: failed fetch from $MIRROR_URL"
  exit 1
fi
git push mirror
if [ "$?" != "0" ]; then
  echo "ERROR: failed push to $MIRROR_URL"
  exit 1
fi
