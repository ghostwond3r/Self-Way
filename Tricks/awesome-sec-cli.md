# Awesome Security CLI Commands


## ffuf

A go-based single-binary and very fast replacement for both gobuster and wfuzz. It can perform both dirbuster style URL path/extension-specific fuzzing, and also URL param fuzzing.

Wfuzz style of URL param fuzzing:
```bash
$ ffuf -w /usr/share/commix/src/txt/passwords_john.txt \
       -u 'http://eve.example.com/url/path?username=alice&password=FUZZ' \
       --fw 3 \
       -c
```

Dirbuster/gobuster style of URL path fuzzing:
```bash
$ ffuf -w /usr/share/dirbuster/wordlists/directory-list-2.3-small.txt \
       -u http://eve.example.com/url/path/FUZZ \
       -e php
```

## sudo_killer

Lorem iosum bacon...

```bash
$ sudo_killer.sh -c -r report.txt -e /tmp/
```

To update the CVE database:
```bash
$ ./cve_update.sh
```

## Misc HTTP

**POST using netcat**
Sometimes curl and wget just aren't avialble, or you are using busybox which has a version of wget that can only GET, not POST.
```bash
POST_PATH="/login.cgi"
HOST=199.188.1.99
BODY="Put here HTML body...."
BODY_LEN=$( echo -n "${BODY}" | wc -c )

echo -ne "POST ${POST_PATH} HTTP/1.0\r\nHost: ${HOST}\r\nContent-Type: application/x-www-form-urlencoded\r\nContent-Length: ${BODY_LEN}\r\n\r\n${BODY}" \
|  nc -i 3 ${HOST} 80
```
[source](https://www.egeek.me/2014/08/17/sending-http-post-request-with-netcat/)