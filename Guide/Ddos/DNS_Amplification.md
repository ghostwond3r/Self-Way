## What is DNS Amplification

* Its a type of DDoS attack where attackers abuse a property of the DNS protocol to amplify their DDoS attack output. 

* This property being that DNS reponses are always bigger than DNS requests.

* Instead of sending packets directly to the victim, attackers will send DNS requests to an open resolver with the packet's source IP spoofed as the victims' IP. 

* The DNS server will then send the response to the victim instead of the original sender. 

* This makes the DDoS attack much more efficient for an attacker as they have to send much less data to DDoS their victim. 

* The ratio between the request size and the response size is what we call the amplification factor.

* This amplification property is not unique to the DNS protocol, it also applies to NTP for example. 

* Different protocols and different types of requests have different amplification factors.

Here how to use DNS Amplification: https://gist.github.com/thom-s/7b3fcdcb88c0670167ccdd6ebca3c924
