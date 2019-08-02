This Docker image helps you start your own proxy server, with HTTP Basic
authorization. You may need this if you want your crawling/scaping software
to look like constantly going to the Network from the same IP address. You
rent a VPS, start a Squid server there and configure your software to
go everywhere through an explicit HTTP(S) proxy.

First, you pull it:

```bash
```

Then, you run it:

```
$ docker run --name proxy -d --restart=always --publish 3128:3128 \
  -e
  yegor256/squid-proxy
```
