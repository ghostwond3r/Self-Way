10 examples of how you can use "grep" command:
<br>
<br>

1. Finding sensitive information in a file:
```
grep -i "password" file.txt
```
*This will search for the word "password" in the file.txt and print any lines that contain it.*

2. Finding a specific string in a directory:
```
grep -r "string" /path/to/directory/
```
*This will search for the string "string" in all files under the /path/to/directory/ and print any lines that contain it.*

3. Searching for a pattern in a log file:
```
grep "error" /var/log/syslog
```
*This will search for the word "error" in the syslog file and print any lines that contain it.*

4. Finding open ports in a network:
```
nmap 192.168.0.1-255 | grep open
```
*This will scan the network 192.168.0.1 to 192.168.0.255 for open ports and print the open ports using grep.*

5. Searching for vulnerable software versions:
```
cat /etc/issue | grep -E "Ubuntu|Debian|CentOS|Red Hat"
```
*This will search for the operating system name in the issue file and print it using grep.*

6. Searching for sensitive information in a web page:
```
curl -sL https://example.com | grep "password"
```
*This will search for the word "password" in the web page of example.com and print any lines that contain it.*

7. Finding all files containing a certain string:
```
grep -l "string" /path/to/directory/*
```
*This will search for the string "string" in all files under the /path/to/directory/ and print the names of files that contain it.*

8. Finding all IP addresses in a file:
```
grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" file.txt
```
*This will search for IP addresses in the file.txt and print them using grep.*

9. Searching for a pattern in a compressed file:
```
zgrep "error" /var/log/syslog.1.gz
```
*This will search for the word "error" in the compressed file syslog.1.gz and print any lines that contain it.*

10. Searching for a pattern in a process list:
```
ps aux | grep "process_name"
```
*This will search for the process name "process_name" in the process list and print any lines that contain it.*

