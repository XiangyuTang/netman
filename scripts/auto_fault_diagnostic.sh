#!/bin/bash

ping_count=5
num_cmp=0

res=($(ping -c $ping_count 127.0.0.1 | grep transmitted))
received_packet=${res[3]}
echo "-------ping 127.0.0.1-------"
if [ $received_packet -gt $num_cmp ]
then    
    echo "The local TCP/IP stack is fine."
else
    echo "Test finished: the network is down!"
    echo "It is recommended to check whether your TCP/IP stack is installed. You may install TCP/IP or reinstall the NIC driver."
    exit
fi

ipaddr=($(ifconfig -a|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d "addr:"))
echo "-------ping local IP address: "$ipaddr"-------"
res=($(ping -c $ping_count $ipaddr | grep transmitted))
received_packet=${res[3]}
if [ $received_packet -gt $num_cmp ]
then    
    echo "NIC driver is fine."
else
    echo "Test finished: the network is down!"
    echo "It is recommended to check NIC driver. You may reinstall the NIC driver."
    exit
fi

gwaddr=($(route | grep 'default' | awk '{print $2}'))
echo "-------ping gateway address: "$gwaddr"-------"
res=($(ping -c $ping_count $gwaddr | grep transmitted))
received_packet=${res[3]}
if [ $received_packet -gt $num_cmp ]
then    
    echo "The link between your device and the router is fine."
else
    echo "Test finished: the network is down!"
    echo "It is recommended to check ip address configuration or router. You may check whether the IP address and the gateway address are in the same segment, whether the router is off and whether the router or the network cable is faulty."
    exit
fi

hostname=""
if [ $1 ]
then 
    hostname=$1
else
    hostname="www.baidu.com"
fi
# echo $hostname
echo "-------ping public address: "$hostname"-------"
res=($(ping -c $ping_count $hostname | grep transmitted))
received_packet=${res[3]}
if [ $received_packet -gt $num_cmp ]
then    
    echo "Test finished: the network is fine."
else
    echo "Test finished: the network is down!"
    res2=($(nslookup $hostname | grep -c "connection timed out"))
    if [ $res2 -gt $num_cmp ] # dns is error
    then
        
        echo "Unable to resolve domain name: $hostname. It is recommended to check the DNS server. You may clear the DNS cache or set the DNS server address."
    else
        echo "It is recommended to contact your network operator."
    fi
    exit
fi
