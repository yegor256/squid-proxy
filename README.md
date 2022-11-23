[![docker](https://github.com/yegor256/squid-proxy/actions/workflows/docker.yml/badge.svg)](https://github.com/yegor256/squid-proxy/actions/workflows/docker.yml)
[![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/yegor256/squid-proxy)](https://hub.docker.com/r/yegor256/squid-proxy)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/yegor256/total/squid-proxy/master/LICENSE.txt)

[This](https://hub.docker.com/r/yegor256/squid-proxy) [Docker](https://www.docker.com/)
image helps you start your own [Squid](http://www.squid-cache.org/) proxy server, with
[HTTP Basic authorization](https://en.wikipedia.org/wiki/Basic_access_authentication).
You may need this if you want your crawling/scaping software
to look like constantly going to the Network from the same IP address. You
rent a VPS, start a Squid server there and configure your software to
go everywhere through an explicit HTTP(S) proxy.

When Docker is [installed](https://docs.docker.com/install/), run this:

```bash
$ docker run --name proxy --detach --restart=always --publish 8081:3128 \
  --env USERNAME=jeffrey --env PASSWORD=swordfish \
  yegor256/squid-proxy
```

Now you can connect to `localhost:8081` with `jeffrey:swordfish` credentials.

BTW, the proxy is [anonymous](https://en.wikipedia.org/wiki/Anonymizer).
Once it's up and running, you can check whether it's visible,
[here](http://amibehindaproxy.com/). It also doesn't store any logs and doesn't
cache any content.
