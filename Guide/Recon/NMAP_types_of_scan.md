# NMAP TYPE OF SCAN
*Short version*
	
## Types of scans

### Connect scan
| Identifies open ports by establishing a TCP handshake with the target
```
nmap -sT -v -p- <IP/DOMAIN>
```

### Half-open scan
| Also known as Stealth scan is to not completing the TCP handshake by abruptly resetting the communication
```
nmap -sS -v <IP/DOMAIN>
```

### Check for Live Systems
| Ping basic
```
ping -c 4 <IP/DOMAIN>
```

### Check for Open Ports
| Port scanning 
```
nmap -v -p- --open <IP/DOMAIN>
nmap -v --top-ports <IP/DOMAIN>
```
		
### XMAS scan
| Sending packets set with PSH, URG, FIN flags
* Port open = target does not respond
* Port close = target send a reset response
```
nmap -sX -v <IP/DOMAIN>
```	

### FIN scan
* Set in the TCP packets sent to the target
* Port open = target does not respond 
* Port close = target send a reset response
```
nmap -SF -v <IP/DOMAIN>
```

### ACK scan
* Set the ACK flag in the TCP header
* Port status is gathered based on window size and TTL value of RESET packets received from the target
```
nmap -SA -v <IP/DOMAIN>
```

### Null Scan
* Sending TCP packets with no flags set to the target
* Port open = target does not respond 
* Port close = target send a reset response
```
nmap -sN -v -p- <IP/DOMAIN>
```	

### Idle Scan
* Idle machine on the network to probe the status details of target ports
```
nmap -Pn -sI -v <Zombie_IP> <TARGET_IP>
```

