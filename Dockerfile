# The MIT License (MIT)
#
# Copyright (c) 2019-2024 Yegor Bugayenko
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included
# in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

FROM ubuntu:24.04

LABEL maintainer="Yegor Bugayenko <yegor256@gmail.com>"
LABEL version="0.0.0"

RUN apt-get update -y --fix-missing \
  && apt-get -y install --no-install-recommends \
    squid=6.6-1ubuntu5 \
    apache2-utils=2.4.58-1ubuntu8.1 \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

COPY entry.sh /
COPY squid.conf /etc/squid/squid.conf
RUN chmod a+x /entry.sh

EXPOSE 3128/tcp

ENTRYPOINT ["/entry.sh"]
