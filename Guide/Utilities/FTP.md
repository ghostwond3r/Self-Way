
# FTP

Default port: `21/tcp`

## Scan 
    ftp <ipAddress>

## Nmap 
    nmap --script ftp-anon,ftp-bounce,ftp-libopie,ftp-proftpd-backdoor,ftp-vsftpd-backdoor,ftp-vuln-cve2010-4221,tftp-enum -p 21 TARGET_IP

## Connection Client  
    ftp TARGET_IP

## Ftpmap
    ftpmap -s TARGET_IP

## List recursive 

> Anonymous

    lftp  TARGET_IP
> Authenticity

```zsh
lftp -u 'USER,PASSWORD' TARGET_IP
```

> Upload file 

    put fileToUpload

> Download recursive 

    mirror

If there are problem with the passive-mode passive-mode:

    set ftp:passive-mode off

## Anonymous

    ftp TARGET_IP
    Name (): anonymous

## Download all 

    prompt
    mget *

## Msf

> anonymous
> 
    use auxiliary/scanner/ftp/anonymous
    msf auxiliary(anonymous) >set RHOSTS TARGET_IP
    msf auxiliary(anonymous) >exploit

> ftp_version
> 
    use auxiliary/scanner/ftp/ftp_version
    msf auxiliary(ftp_version) > set RHOSTS TARGET_IP
    msf auxiliary(ftp_version) > exploit

> ftp_login
> 
    use auxiliary/scanner/ftp/ftp_login
    set RHOSTS TARGET_IP
    set USER_AS_PASS true
    set pass_file /opt/metasploit/data/wordlists/unix_passwords.txt
    set user_file /opt/metasploit/data/wordlists/unix_username.txt
    exploit
