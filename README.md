# curl-http3
[![](https://img.shields.io/docker/cloud/build/ymuski/curl-http3?style=flat-square)](https://hub.docker.com/r/ymuski/curl-http3)
[![](https://img.shields.io/docker/cloud/automated/ymuski/curl-http3?style=flat-square)](https://hub.docker.com/r/ymuski/curl-http3)
[![](https://img.shields.io/docker/pulls/ymuski/curl-http3?style=flat-square)](https://hub.docker.com/r/ymuski/curl-http3)

Docker image of `curl` compiled with  `BoringSSL` and `quiche/0.8.0` for **HTTP3 support**, `httpstat` for visualization.

**Usage**

`docker run -it --rm ymuski/curl-http3 curl -V`
```
curl 7.76.1-DEV (x86_64-pc-linux-gnu) libcurl/7.76.0-DEV BoringSSL quiche/0.8.0
Release-Date: [unreleased]
Protocols: dict file ftp ftps gopher gophers http https imap imaps mqtt pop3 pop3s rtsp smb smbs smtp smtps telnet tftp 
Features: alt-svc AsynchDNS HTTP3 HTTPS-proxy IPv6 Largefile NTLM NTLM_WB SSL UnixSockets
```

`docker run -it --rm ymuski/curl-http3 curl -ILv https://yurets.pro --http3`

```

< HTTP/3 200
HTTP/3 200
< date: Sat, 10 Oct 2020 14:05:46 GMT
date: Sat, 10 Oct 2020 14:05:46 GMT
< content-type: text/html; charset=UTF-8
content-type: text/html; charset=UTF-8
< set-cookie: __cfduid=d02abb852df336034b8943517216a56421602338746; expires=Mon, 09-Nov-20 14:05:46 GMT; path=/; domain=.yurets.pro; HttpOnly; SameSite=Lax; Secure
set-cookie: __cfduid=d02abb852df336034b8943517216a56421602338746; expires=Mon, 09-Nov-20 14:05:46 GMT; path=/; domain=.yurets.pro; HttpOnly; SameSite=Lax; Secure
< x-powered-by: Express
x-powered-by: Express
< cache-control: public, max-age=0
cache-control: public, max-age=0
< last-modified: Sun, 03 May 2020 17:51:55 GMT
last-modified: Sun, 03 May 2020 17:51:55 GMT
< vary: Accept-Encoding
vary: Accept-Encoding
< strict-transport-security: max-age=15552000; includeSubDomains; preload
strict-transport-security: max-age=15552000; includeSubDomains; preload
< cf-cache-status: DYNAMIC
cf-cache-status: DYNAMIC
< cf-request-id: 05b46e08cc0000c3d4420e6200000001
cf-request-id: 05b46e08cc0000c3d4420e6200000001
< expect-ct: max-age=604800, report-uri="https://report-uri.cloudflare.com/cdn-cgi/beacon/expect-ct"
expect-ct: max-age=604800, report-uri="https://report-uri.cloudflare.com/cdn-cgi/beacon/expect-ct"
< report-to: {"endpoints":[{"url":"https:\/\/a.nel.cloudflare.com\/report?lkg-colo=158&lkg-time=1602338747"}],"group":"cf-nel","max_age":604800}
report-to: {"endpoints":[{"url":"https:\/\/a.nel.cloudflare.com\/report?lkg-colo=158&lkg-time=1602338747"}],"group":"cf-nel","max_age":604800}
< nel: {"report_to":"cf-nel","max_age":604800}
nel: {"report_to":"cf-nel","max_age":604800}
< x-content-type-options: nosniff
x-content-type-options: nosniff
< server: cloudflare
server: cloudflare
< cf-ray: 5e00e5ee1bf8c3d4-LED
cf-ray: 5e00e5ee1bf8c3d4-LED
< alt-svc: h3-27=":443"; ma=86400, h3-28=":443"; ma=86400, h3-29=":443"; ma=86400
alt-svc: h3-27=":443"; ma=86400, h3-28=":443"; ma=86400, h3-29=":443"; ma=86400
* Connection #0 to host yurets.pro left intact
```

**httpstat support**

`docker run -it --rm ymuski/curl-http3 ./httpstat.sh -ILv https://blog.cloudflare.com --http3`

`docker run -it --rm ymuski/curl-http3 ./httpstat.sh -ILv https://yurets.pro --http3`

![](httpstat.png?raw=true "HTTPSTAT H3")