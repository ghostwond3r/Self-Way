# Password Harvesting:

Passwords can be found in many places

```
# Process lists
user@victim $ ps -efw


# Usernames entered into login prompt by mistake
user@victim $ last -f /var/log/bmtp


# Usernames entered into command line arguments
user@victim $ cat /home/*/.*history


# Passwords saved in web files
user@victim $ grep -iR password /var/www


# SSH keys
user@victim $ cat /home/*/.ssh/id*
```


## Unusual Accounts:


Look in /etc/passwd for new accounts in a sorted list:
```
user@RoseSecurity $ sort -nk3 -t: /etc/passwd | less
```

Look for users with a UID of 0:
```
user@RoseSecurity $ grep :0: /etc/passwd
```

# Routers:

Resources:
```
 https://www.routerpasswords.com
```