# curl-http3
[![](https://img.shields.io/docker/cloud/build/ymuski/curl-http3?style=flat-square)](https://hub.docker.com/r/ymuski/curl-http3)
[![](https://img.shields.io/docker/cloud/automated/ymuski/curl-http3?style=flat-square)](https://hub.docker.com/r/ymuski/curl-http3)
[![](https://img.shields.io/docker/pulls/ymuski/curl-http3?style=flat-square)](https://hub.docker.com/r/ymuski/curl-http3)

Docker image of `curl` compiled with  `BoringSSL` and `quiche/0.8.0` for **HTTP3 support**, `httpstat` for visualization.

Link for [curl + http3 manual](https://github.com/curl/curl/blob/master/docs/HTTP3.md#quiche-version)

**Usage**

`docker run -it --rm ymuski/curl-http3 curl -V`
```
curl 7.76.1-DEV (x86_64-pc-linux-gnu) libcurl/7.76.0-DEV BoringSSL quiche/0.8.0
Release-Date: [unreleased]
Protocols: dict file ftp ftps gopher gophers http https imap imaps mqtt pop3 pop3s rtsp smb smbs smtp smtps telnet tftp 
Features: alt-svc AsynchDNS HTTP3 HTTPS-proxy IPv6 Largefile NTLM NTLM_WB SSL UnixSockets
```


`docker run -it --rm ymuski/curl-http3 curl -IL https://blog.cloudflare.com --http3`

`docker run -it --rm ymuski/curl-http3 curl -IL https://yurets.pro --http3`

```

HTTP/3 200
date: Tue, 30 Mar 2021 14:30:08 GMT
content-type: text/html; charset=UTF-8
set-cookie: __cfduid=d3fa946aadf6d55fcb8e031c9d3472f381617114608; expires=Thu, 29-Apr-21 14:30:08 GMT; path=/; domain=.yurets.pro; HttpOnly; SameSite=Lax; Secure
x-powered-by: Express
cache-control: public, max-age=0
last-modified: Sat, 23 Jan 2021 22:47:49 GMT
vary: Accept-Encoding
strict-transport-security: max-age=15552000; includeSubDomains; preload
cf-cache-status: DYNAMIC
cf-request-id: 092523ca150000414bd7198000000001
expect-ct: max-age=604800, report-uri="https://report-uri.cloudflare.com/cdn-cgi/beacon/expect-ct"
report-to: {"group":"cf-nel","max_age":604800,"endpoints":[{"url":"https:\/\/a.nel.cloudflare.com\/report?s=fPA8tI4jfvl0nSQqFh0HtbJp1iYd%2FlhEBduxdQ5QDHhFXs8pDsejYxasX2HCULGutzSzg22bg79iMEl5Qz1b3NrlHhwx%2BXvv67kP"}]}
nel: {"report_to":"cf-nel","max_age":604800}
x-content-type-options: nosniff
server: cloudflare
cf-ray: 638208bcea6b414b-HAM
alt-svc: h3-27=":443"; ma=86400, h3-28=":443"; ma=86400, h3-29=":443"; ma=86400

```

**httpstat support**

`docker run -it --rm ymuski/curl-http3 ./httpstat.sh -ILv https://blog.cloudflare.com --http3`

`docker run -it --rm ymuski/curl-http3 ./httpstat.sh -ILv https://yurets.pro --http3`

![](httpstat.png?raw=true "HTTPSTAT H3")