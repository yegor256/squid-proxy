#!/bin/sh

set -x
set -e

htpasswd -c /etc/squid/passwd "${USERNAME}" "${PASSWORD}"

/etc/init.d/squid start
