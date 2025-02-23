# The MIT License (MIT)
#
# SPDX-FileCopyrightText: Copyright (c) 2019-2025 Yegor Bugayenko
# SPDX-License-Identifier: MIT

FROM ubuntu:24.04

LABEL repository="https://github.com/yegor256/squid-proxy"
LABEL maintainer="Yegor Bugayenko <yegor256@gmail.com>"
LABEL version="0.0.0"

RUN apt-get update -y --fix-missing \
  && apt-get -y install --no-install-recommends \
    squid=6.6-1ubuntu5 \
    apache2-utils=2.4.58-1ubuntu8 \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

COPY entry.sh /
COPY squid.conf /etc/squid/squid.conf
RUN chmod a+x /entry.sh

EXPOSE 3128/tcp

ENTRYPOINT ["/entry.sh"]
