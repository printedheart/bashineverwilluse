#!/bin/sh
echo "Destroying all firewall rules..."
#read -r -p "Are you sure? [y/N] " response
#case $response in
#    [yY][eE][sS]|[yY])     
#if $response = [yY][eE][sS]|[yY]

#then
    echo "Let's do something risky"
#    exec "iptables-save > /etc/iptables-nutball"
    exec iptables -F
    exec iptables -X
    exec iptables -t nat -F
    exec iptables -t nat -X
    exec iptables -t mangle -F
    exec iptables -t mangle -X
    exec iptables -P INPUT ACCEPT
    exec iptables -P FORWARD ACCEPT
    exec iptables -P OUTPUT ACCEPT
    echo "In case you lost your sanity, I saved your iptables in /etc/"
#else
    echo "Exiting SAFELY ;;(O-O);;"
    exit 0
#fi
