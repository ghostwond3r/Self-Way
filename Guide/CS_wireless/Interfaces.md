# WiFi Interfaces Management

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
