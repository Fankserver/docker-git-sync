#!/bin/sh
set -e

cd /mnt/*
if [ "$?" != "0" ]; then
  echo "ERROR: Repo does not exists"
  exit 1
fi
git fetch origin --prune
if [ "$?" != "0" ]; then
  echo "ERROR: failed fetch from $ORIGIN_URL"
  exit 1
fi
git fetch origin --prune --tags
if [ "$?" != "0" ]; then
  echo "ERROR: failed fetch from $ORIGIN_URL"
  exit 1
fi
git push --force --tags mirror refs/heads/*:refs/heads/*
if [ "$?" != "0" ]; then
  echo "ERROR: failed push to $MIRROR_URL"
  exit 1
fi
