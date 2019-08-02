#!/bin/sh

set -x
set -e

if [ -z "${USERNAME}" ]; then
  echo "You have to specify the -e USERNAME=... argument"
  exit -1
fi
if [ -z "${PASSWORD}" ]; then
  echo "You have to specify the -e PASSWORD=... argument"
  exit -1
fi

htpasswd -c /etc/squid/passwd "${USERNAME}" "${PASSWORD}"

/etc/init.d/squid start
