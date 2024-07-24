# Docker Image of an Anonymous HTTP Proxy

[![docker](https://github.com/yegor256/squid-proxy/actions/workflows/docker.yml/badge.svg)](https://github.com/yegor256/squid-proxy/actions/workflows/docker.yml)
[![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/yegor256/squid-proxy)](https://hub.docker.com/r/yegor256/squid-proxy)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/yegor256/total/squid-proxy/master/LICENSE.txt)

[This](https://hub.docker.com/r/yegor256/squid-proxy)
[Docker](https://www.docker.com/)
image helps you start your own [Squid](http://www.squid-cache.org/)
proxy server, with [HTTP Basic authorization][basic].
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

Or, you can use docker compose:

```yaml
version: '3'
services:
  proxy:
    image: yegor256/squid-proxy
    restart: always
    ports:
      - "8081:3128"
    environment:
      - USERNAME=jeffrey
      - PASSWORD=swordfish
```

Now you can connect to `localhost:8081` with `jeffrey:swordfish`
credentials. For example:

```bash
curl -vvv --proxy http://jeffrey:swordfish@0.0.0.0:8081 https://google.com/
```

Or, with httpie:

```shell
http --proxy=http:http://jeffrey:swordfish@0.0.0.0:8081 https://google.com/
```

BTW, the proxy is [anonymous](https://en.wikipedia.org/wiki/Anonymizer).
Once it's up and running, you can check whether it's visible,
[here](http://amibehindaproxy.com/). It also doesn't store any logs and doesn't
cache any content.

## Developing

Build it locally:

```bash
docker build . -t squid-proxy:latest
```

Want to push to a local machine?

```bash
docker save squid-proxy | ssh -C your@machine docker load
```

[basic]: https://en.wikipedia.org/wiki/Basic_access_authentication
