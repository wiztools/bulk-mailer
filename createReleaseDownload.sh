#!/bin/sh

if [ -z "$1" ]; then
  echo "Please enter version number as parameter!"
  exit 1
fi

VERSION=$1
DIR_NAME=bMailer-${VERSION}

mkdir /tmp/${DIR_NAME}
cp src/* /tmp/${DIR_NAME}
cd /tmp
tar -czf ${DIR_NAME}.tgz ${DIR_NAME}
echo Created /tmp/${DIR_NAME}.tgz

