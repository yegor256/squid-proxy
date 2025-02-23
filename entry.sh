#!/bin/sh

# SPDX-FileCopyrightText: Copyright (c) 2019-2025 Yegor Bugayenko
# SPDX-License-Identifier: MIT

set -x
set -e

if [ -z "${USERNAME}" ]; then
  echo "You have to specify the -e USERNAME=... argument"
  exit 1
fi

if [ -z "${PASSWORD}" ]; then
  echo "You have to specify the -e PASSWORD=... argument"
  exit 1
fi

htpasswd -cb /etc/squid/passwd "${USERNAME}" "${PASSWORD}"

rm -f /run/squid.pid

exec "$(which squid)" -NYCd 1
