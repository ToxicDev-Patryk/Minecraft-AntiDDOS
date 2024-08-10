#!/bin/bash

iptables -F
iptables -X

iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# CHANGE THIS IF YOU HAVE YOUR SERVER ON DIFFERENT PORT! OR ADD MORE PORTS FOR BUNGEECORD
# CHANGE THIS IF YOU HAVE YOUR SERVER ON DIFFERENT PORT! OR ADD MORE PORTS FOR BUNGEECORD
# CHANGE THIS IF YOU HAVE YOUR SERVER ON DIFFERENT PORT! OR ADD MORE PORTS FOR BUNGEECORD

iptables -A INPUT -p tcp --dport 25565 -j ACCEPT
#iptables -A INPUT -p tcp --dprot 25577 -j ACCEPT

# CHANGE THIS IF YOU HAVE YOUR SERVER ON DIFFERENT PORT! OR ADD MORE PORTS FOR BUNGEECORD
# CHANGE THIS IF YOU HAVE YOUR SERVER ON DIFFERENT PORT! OR ADD MORE PORTS FOR BUNGEECORD
# CHANGE THIS IF YOU HAVE YOUR SERVER ON DIFFERENT PORT! OR ADD MORE PORTS FOR BUNGEECORD

iptables -A INPUT -m conntrack --ctstate INVALID -j DROP

iptables -A INPUT -p tcp --syn -m limit --limit 2/s --limit-burst 3 -j ACCEPT
s
iptables -A INPUT -p tcp --tcp-flags RST RST -m limit --limit 2/s --limit-burst 2 -j ACCEPT

iptables -A INPUT -p tcp --syn -m limit --limit 1/s --limit-burst 3 -j ACCEPT

iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP

iptables -A INPUT -p icmp -j DROP

iptables -A INPUT -j LOG --log-prefix "iptables: "
iptables -A INPUT -j DROP

iptables-save > /etc/iptables/rules.v4

echo "IPTABLES rules for anti-DDoS protection have been applied."
