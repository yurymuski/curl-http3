# curl-http3
Docker image of `curl` compiled with  `BoringSSL` and `quiche/0.2.0` for **HTTP3 support**

**Usage**

`docker run -it --rm ymuski/curl-http3 curl -V`
```
curl 7.69.0-DEV (x86_64-pc-linux-gnu) libcurl/7.69.0-DEV BoringSSL quiche/0.2.0
Release-Date: [unreleased]
Protocols: dict file ftp ftps gopher http https imap imaps pop3 pop3s rtsp smb smbs smtp smtps telnet tftp 
Features: alt-svc AsynchDNS HTTP3 HTTPS-proxy IPv6 Largefile NTLM NTLM_WB SSL UnixSockets
```

`docker run -it --rm ymuski/curl-http3 curl -ILv https://yurets.pro --http3`

```

< HTTP/3 200
HTTP/3 200
< date: Mon, 10 Feb 2020 22:50:51 GMT
date: Mon, 10 Feb 2020 22:50:51 GMT
< content-type: text/html; charset=UTF-8
content-type: text/html; charset=UTF-8
< set-cookie: __cfduid=d5236cbf77814110ccd8c6e43d331518f1581375051; expires=Wed, 11-Mar-20 22:50:51 GMT; path=/; domain=.yurets.pro; HttpOnly; SameSite=Lax; Secure
set-cookie: __cfduid=d5236cbf77814110ccd8c6e43d331518f1581375051; expires=Wed, 11-Mar-20 22:50:51 GMT; path=/; domain=.yurets.pro; HttpOnly; SameSite=Lax; Secure
< x-powered-by: Express
x-powered-by: Express
< cache-control: public, max-age=0
cache-control: public, max-age=0
< last-modified: Mon, 03 Feb 2020 14:45:35 GMT
last-modified: Mon, 03 Feb 2020 14:45:35 GMT
< vary: Accept-Encoding
vary: Accept-Encoding
< strict-transport-security: max-age=15552000; includeSubDomains; preload
strict-transport-security: max-age=15552000; includeSubDomains; preload
< cf-cache-status: DYNAMIC
cf-cache-status: DYNAMIC
< expect-ct: max-age=604800, report-uri="https://report-uri.cloudflare.com/cdn-cgi/beacon/expect-ct"
expect-ct: max-age=604800, report-uri="https://report-uri.cloudflare.com/cdn-cgi/beacon/expect-ct"
< alt-svc: h3-24=":443"; ma=86400, h3-23=":443"; ma=86400
alt-svc: h3-24=":443"; ma=86400, h3-23=":443"; ma=86400
< x-content-type-options: nosniff
x-content-type-options: nosniff
< server: cloudflare
server: cloudflare
< cf-ray: 5631a4f699ab0065-DME
cf-ray: 5631a4f699ab0065-DME
* Connection #0 to host yurets.pro left intact
```