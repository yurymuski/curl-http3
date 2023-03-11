# curl-http3
[![](https://img.shields.io/docker/cloud/automated/ymuski/curl-http3?style=flat-square)](https://hub.docker.com/r/ymuski/curl-http3)
[![](https://img.shields.io/docker/pulls/ymuski/curl-http3?style=flat-square)](https://hub.docker.com/r/ymuski/curl-http3)

Docker image of `curl` compiled with  `BoringSSL` and `quiche/0.16.0` for **HTTP3 support**, `httpstat` for visualization.

Link for [curl + http3 manual](https://github.com/curl/curl/blob/master/docs/HTTP3.md#quiche-version)

**Usage**

`docker run -it --rm ymuski/curl-http3 curl -V`
```
curl 7.88.1-DEV (x86_64-pc-linux-gnu) libcurl/7.88.1-DEV BoringSSL quiche/0.16.0
Release-Date: [unreleased]
Protocols: dict file ftp ftps gopher gophers http https imap imaps mqtt pop3 pop3s rtsp smb smbs smtp smtps telnet tftp
Features: alt-svc AsynchDNS HSTS HTTP3 HTTPS-proxy IPv6 Largefile NTLM NTLM_WB SSL threadsafe UnixSockets
```


`docker run -it --rm ymuski/curl-http3 curl -IL https://blog.cloudflare.com --http3`

`docker run -it --rm ymuski/curl-http3 curl -IL https://yurets.pro --http3`

```

HTTP/3 200
date: Sat, 11 Mar 2023 19:00:27 GMT
content-type: text/html
last-modified: Sun, 26 Sep 2021 16:14:14 GMT
strict-transport-security: max-age=15552000; includeSubDomains; preload
cf-cache-status: DYNAMIC
report-to: {"endpoints":[{"url":"https:\/\/a.nel.cloudflare.com\/report\/v3?s=yahJYXDYhwOOISvzvC%2FZq%2FR5WqEelZ%2FGNGT0oNo5y4Ar%2Bo69%2FhyOuokZeF%2FGWXAiC55dkGrgpULKb38pM1fx2jLgOsSeHtHPPCaVPrtpdet4kk5APgG%2BgI6LInAI"}],"group":"cf-nel","max_age":604800}
nel: {"success_fraction":0,"report_to":"cf-nel","max_age":604800}
x-content-type-options: nosniff
server: cloudflare
cf-ray: 7a660a5778fbbaac-MXP
alt-svc: h3=":443"; ma=86400, h3-29=":443"; ma=86400

```

**httpstat support**

`docker run -it --rm ymuski/curl-http3 ./httpstat.sh -ILv https://blog.cloudflare.com --http3`

`docker run -it --rm ymuski/curl-http3 ./httpstat.sh -ILv https://yurets.pro --http3`

![](httpstat.png?raw=true "HTTPSTAT H3")