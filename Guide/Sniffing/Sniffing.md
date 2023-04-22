Sniffing, also known as packet sniffing or network sniffing, is a reconnaissance process in which an attacker intercepts and analyzes network traffic to gather information about a target system, network, or devices. It is a passive technique, meaning that the attacker is simply "listening" to the network traffic without actively sending any packets or interacting with the target system.

The process of sniffing in recon typically involves the following steps:

• Choose the right tool: Select an appropriate network sniffing tool, such as Wireshark, tcpdump, or Ettercap, that allows you to capture and analyze network packets.

• Set up the sniffer: Configure the network interface card (NIC) of the attacker's device to operate in promiscuous mode. This mode allows the NIC to capture all network packets, regardless of their destination, instead of only capturing packets addressed to the device.

• Capture network traffic: Use the chosen sniffing tool to start capturing network packets that pass through the network segment the attacker's device is connected to.

• Filter and analyze packets: Analyze the captured packets to extract valuable information about the target network and devices. You can use filters and search functions in the sniffing tool to focus on specific protocols, IP addresses, or data patterns that may reveal important details, such as usernames, passwords, or network configurations.

• Identify vulnerabilities: Use the gathered information to identify potential vulnerabilities, misconfigurations, or weak security practices in the target system or network. This information can be used to plan and execute further attacks.




# Sniffing tools

* Network Sniffers:
    1. [ChaosReader](http://www.brendangregg.com/chaosreader.html)
    2. [DarkStat](https://unix4lyfe.org/darkstat/)
    3. [Driftnet](https://github.com/deiv/driftnet)
    4. [Dsniff](https://www.monkey.org/~dugsong/dsniff) && [Mac OSX version](https://github.com/YeautyYE/arpspoof)
    5. [Netsniff-ng](http://netsniff-ng.org)
    
* Spoofing and MITM:
    1. [DNSChef](https://github.com/iphelix/dnschef)
    2. [ISR-Evilgrade](https://github.com/infobyte/evilgrade)
    3. [Fiked (FakeIKEd)](https://www.roe.ch/FakeIKEd)
    4. [Rebind](https://code.google.com/archive/p/rebind/) && [Backup](https://gitlab.com/kalilinux/packages/rebind)
    5. [SSLStrip3](https://github.com/mh4x0f/sslstrip3)
    6. [SSLSplit](https://www.roe.ch/SSLsplit)
    7. [TCPReplay](https://tcpreplay.appneta.com)
    8. [WiFi Honey](https://digi.ninja/projects/wifi_honey.php) && [Backup](https://gitlab.com/kalilinux/packages/wifi-honey)

1. [Ettercap](https://www.ettercap-project.org)
2. [Bettercap](https://www.bettercap.org)
3. [Tcpdump](https://www.tcpdump.org)
4. [Wireshark](https://www.wireshark.org)
5. [Responder](https://github.com/lgandx/Responder) && [Responder-Windows](https://github.com/lgandx/Responder-Windows) (Windows version for Responder which is great for external pentesting to overcome the limits of a limited LAN network. This native program can serve as a dropper)
6. [Pretender](https://github.com/RedTeamPentesting/pretender)
7. [Inveigh](https://github.com/Kevin-Robertson/Inveigh) (Powershell version)
8. [InveighZero](https://github.com/Kevin-Robertson/InveighZero) (C# version)
9. [KrbRelayUp](https://github.com/Dec0ne/KrbRelayUp)
10. [MITM6](https://github.com/fox-it/mitm6)
11. [Espionage](https://github.com/josh0xA/Espionage)
12. [Seth](https://github.com/SySS-Research/Seth)
13. [Eavesarp](https://github.com/arch4ngel/eavesarp)
14. [PwnFile](https://github.com/navisecdelta/PwnFile)
15. [Bad-Pdf](https://github.com/deepzec/Bad-Pdf)
16. [Snarf](https://github.com/purpleteam/snarf)
17. [SharpWebServer](https://github.com/mgeeky/SharpWebServer)
18. [Cain & Abel](https://github.com/xchwarze/Cain)
19. [NetRipper](https://github.com/NytroRST/NetRipper)


> Taken from https://github.com/ghostsec420/SCPA
