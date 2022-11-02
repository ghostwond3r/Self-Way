```
nslookup -q=TXT o-o.myaddr.l.google.com. ns1.google.com.
```
```
dig -4 TXT +short o-o.myaddr.l.google.com. @ns1.google.com.
```
```
nslookup myip.opendns.com. resolver1.opendns.com.
```
```
dig -4 A +short myip.opendns.com. @resolver1.opendns.com.
```
```
nslookup whoami.akamai.net. ns1-1.akamaitech.net.
```
```
dig -4 A +short whoami.akamai.net. @ns1-1.akamaitech.net.
```
```
curl -s https://api.ipify.org
curl -s https://ifconfig.me/ip
curl -s https://icanhazip.com/
```
