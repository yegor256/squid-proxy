[![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/yegor256/squid-proxy)](https://hub.docker.com/r/yegor256/squid-proxy)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/yegor256/total/squid-proxy/master/LICENSE.txt)

This [Docker](https://www.docker.com/)
image helps you start your own [Squid](http://www.squid-cache.org/) proxy server, with
[HTTP Basic authorization](https://en.wikipedia.org/wiki/Basic_access_authentication).
You may need this if you want your crawling/scaping software
to look like constantly going to the Network from the same IP address. You
rent a VPS, start a Squid server there and configure your software to
go everywhere through an explicit HTTP(S) proxy.

First, you [pull it](https://hub.docker.com/r/yegor256/squid-proxy):

```bash
$ docker pull yegor256/squid-proxy:0.1
```

Then, you run it:

```
$ docker run --name proxy -d --restart=always --publish 8081:3128 \
  -e USERNAME=jeffrey -e PASSWORD=swordfish \
  yegor256/squid-proxy:0.1
```

Now you can connect to `localhost:8081` with `jeffrey:swordfish` credentials.

BTW, the proxy is [anonymous](https://en.wikipedia.org/wiki/Anonymizer).
Once it's up and running, you can check whether it's visible,
[here](http://amibehindaproxy.com/). It also doesn't store any logs and doesn't
cache any content.

Here is how you [install](https://docs.docker.com/install/) Docker.
