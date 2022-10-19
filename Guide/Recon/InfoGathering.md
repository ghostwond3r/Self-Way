# Information Gathering

## Network Discovery

Basic Nmap
```
sudo nmap -sSV -p- 192.168.0.1 -oA OUTPUTFILE -T4
sudo nmap -sSV -oA OUTPUTFILE -T4 -iL INPUTFILE.csv

• the flag -sSV defines the type of packet to send to the server and tells Nmap to try and determine any service on open ports
• the -p- tells Nmap to check all 65,535 ports (by default it will only check the most popular 1,000)
• 192.168.0.1 is the IP address to scan
• -oA OUTPUTFILE tells Nmap to output the findings in its three major formats at once using the filename "OUTPUTFILE"
• -iL INPUTFILE tells Nmap to use the provided file as inputs
```

CTF NMAP
```
nmap -sV -sC -oA ~/nmap-initial 192.168.1.1

-sV : Probe open ports to determine service/version info
-sC : to enable the script
-oA : to save the results

After this quick command you can add "-p-" to run a full scan while you work with the previous result
```

Aggressive NMAP
```
nmap -A -T4 scanme.nmap.org
• -A: Enable OS detection, version detection, script scanning, and traceroute
• -T4: Defines the timing for the task (options are 0-5 and higher is faster)
```

Using searchsploit to detect vulnerable services
```
nmap -p- -sV -oX a.xml IP_ADDRESS; searchsploit --nmap a.xml
```

Generating nice scan report
```
nmap -sV IP_ADDRESS -oX scan.xml && xsltproc scan.xml -o "`date +%m%d%y`_report.html"
```

NMAP Scripts
```
nmap -sC : equivalent to --script=default
nmap --script 'http-enum' -v web.xxxx.com -p80 -oN http-enum.nmap
nmap --script smb-enum-users.nse -p 445 [target host]
List Nmap scripts : ls /usr/share/nmap/scripts/
```

Masscan
```
masscan -iL ips-online.txt --rate 10000 -p1-65535 --only-open -oL masscan.out
masscan -e tun0 -p1-65535,U:1-65535 10.10.10.97 --rate 1000
```

find machines on the network
```
sudo masscan --rate 500 --interface tap0 --router-ip $ROUTER_IP --top-ports 100 $NETWORK -oL masscan_machines.tmp
cat masscan_machines.tmp | grep open | cut -d " " -f4 | sort -u > masscan_machines.lst
```

find open ports for one machine
```
sudo masscan --rate 1000 --interface tap0 --router-ip $ROUTER_IP -p1-65535,U:1-65535 $MACHINE_IP --banners -oL $MACHINE_IP/scans/masscan-ports.lst
```

-----------------------------
### TCP grab banners and services information
```
TCP_PORTS=$(cat $MACHINE_IP/scans/masscan-ports.lst| grep open | grep tcp | cut -d " " -f3 | tr '\n' ',' | head -c -1)
[ "$TCP_PORTS" ] && sudo nmap -sT -sC -sV -v -Pn -n -T4 -p$TCP_PORTS --reason --version-intensity=5 -oA $MACHINE_IP/scans/nmap_tcp $MACHINE_IP
```

### UDP grab banners and services information
```
UDP_PORTS=$(cat $MACHINE_IP/scans/masscan-ports.lst| grep open | grep udp | cut -d " " -f3 | tr '\n' ',' | head -c -1)
[ "$UDP_PORTS" ] && sudo nmap -sU -sC -sV -v -Pn -n -T4 -p$UDP_PORTS --reason --version-intensity=5 -oA $MACHINE_IP/scans/nmap_udp $MACHINE_IP
```

-----------------------------
## Passive Recon

WHOIS enumeration
```
whois domain-name-here.com 
```

Perform DNS IP Lookup
```
dig a domain-name-here.com @nameserver 
```

Perform MX Record Lookup
```
dig mx domain-name-here.com @nameserver
```

-----------------------------
## Finger Printing
```
nc -v 192.168.1.1 25
telnet 192.168.1.1 25
```

------------------------------
## Banner grabbing with NC

```
nc TARGET-IP 80
GET / HTTP/1.1
Host: TARGET-IP
User-Agent: Mozilla/5.0
Referrer: meh-domain
<enter>
```

-------------------------------
## Enumeration

NMAP General enumeration

Verbose, syn, all ports, all scripts, no ping
```
nmap -vv -Pn -A -sC -sS -T 4 -p- x.x.x.x
```

Verbose, SYN Stealth, Version info, and scripts against services.
```
nmap -v -sS -A -T4 x.x.x.x
```

Nmap script to scan for vulnerable SMB servers 
– WARNING: unsafe=1 may cause knockover
```
nmap –script smb-check-vulns.nse –script-args=unsafe=1 -p445 x.x.x.x
```

Netdiscover
```
netdiscover -r x.x.x.x/xx
```

FTP port 21
```
nmap –script ftp-anon,ftp-bounce,ftp-libopie,ftp-proftpd-backdoor,ftp-vsftpd-backdoor,ftp-vuln-cve2010-4221,tftp-enum -p 21 x.x.x.x
```

SMTP port 25
```
nmap –script smtp-commands,smtp-enum-users,smtp-vuln-cve2010-4344,smtp-vuln-cve2011-1720,smtp-vuln-cve2011-1764 -p 25 x.x.x.x
```

Web port 80 / 443
```
dirb http://x.x.x.x/
nikto –h x.x.x.x
```

RPCBind port 111
```
rpcinfo –p x.x.x.x
```

SMB \ RPC port 139 / 445
```
enum4linux –a x.x.x.x
nbtscan x.x.x.x
nmap -v x.x.x.x --script smb-enum-domains.nse,smb-enum-groups.nse,smb-enum-processes.nse,smb-enum-sessions.nse,smb-enum-shares.nse,smb-enum-users.nse,smb-ls.nse,smb-mbenum.nse,smb-os-discovery.nse,smb-print-text.nse,smb-psexec.nse,smb-security-mode.nse,smb-server-stats.nse,smb-system-info.nse,smb-vuln-conficker.nse,smb-vuln-cve2009-3103.nse,smb-vuln-ms06-025.nse,smb-vuln-ms07-029.nse,smb-vuln-ms08-067.nse,smb-vuln-ms10-054.nse,smb-vuln-ms10-061.nse,smb-vuln-regsvc-dos.nse
smbclient -L //x.x.x.x/

# List open share;
smbclient //x.x.x.x/ipc$ -U john
```

SNMP port 161
```
snmpwalk -c public -v1 x.x.x.x    
snmpcheck -t x.x.x.x -c public
onesixtyone -c names -i x.x.x.x
nmap -sT -p x.x.x.x -oG snmp_results.txt
snmpenum -t x.x.x.x
```

Oracle port 1521
```
tnscmd10g version -h x.x.x.x
tnscmd10g status -h x.x.x.x
```

Mysql port 3306
```
nmap -sV -Pn -vv  x.x.x.x -p 3306 --script mysql-audit,mysql-databases,mysql-dump-hashes,mysql-empty-password,mysql-enum,mysql-info,mysql-query,mysql-users,mysql-variables,mysql-vuln-cve2012-2122
```

DNS Zone Transfers
```
nslookup -> set type=any -> ls -d example.com
dig axfr example.com @ns1.example.com
dnsrecon -d example.com -D /usr/share/wordlists/dnsmap.txt -t std --xml ouput.xml
```

RID Cycling
```
ridenum.py 192.168.XXX.XXX 500 50000 dict.txt
```

Metasploit module for RID cycling
```
use auxiliary/scanner/smb/smb_lookupsid
```

------------------------------
## Web hosts

Basic HTTP Server. Will list the directory it’s started in.
```
python -m SimpleHTTPServer 80
```

Starts Apache web server
```
service apache2 start
```
