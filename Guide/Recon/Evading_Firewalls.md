# Evading Firewall

How to evade them with NMAP ?

## Decoy Scan (-D)

With this flag, the target believes that is been scanned from multiple addresses
the decoy will be on the gateway, while the second IP is the target.
```
nmap -D 192.168.1.1 192.168.1.100
```

## Random IP address

This is self-explanatory, you can use -D (decoy) for generating random IP address inside the command.
```
nmap -D RND:5 192.168.1.100
```

## Changing the packet source port

TCP protocol generate a random port whenever goes out to the intermet, in a certain way we can craft our port source and set common ones, that  tricks the firewall thinking that it is a legit TCP packet(s) Where the number `53` is the source port.
 ```
nmap -g 53 192.168.1.100
```

## Fragmentation and the MTU option

This one turns the packet into an 8-byte packet, a smaller packet that can be undetectable by firewalls.
```
nmap -f 192.168.1.100
```

## MTU crafting (max transmission unit)

This is similar to fragmentation. Where: `16` is the number of bits.
```
nmap -mtu 16 192.168.1.100
```

## Data length

NMAP transmit probes in specific sizes known for firewalls, the data length option can change the amount of data sent.
This will make think the firewall that the packet is not coming from a **Nmap** scan
```
nmap --data-length 10 192.168.1.100`
```

## MAC spoofing

In a few words, the device cannot link the scanning host with the original machine
```
nmap --spoof-mac 0 192.168.1.100
```
