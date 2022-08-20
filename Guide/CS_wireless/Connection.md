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
