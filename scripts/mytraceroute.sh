#!/bin/bash

:<<EOF
# create a mapping of netman to mtr 
Usage: mtr [options] hostname
netman -mtr help
mtr hostname  => netman -mtr hostname
mtr -u     => netman -mtr udp   
mtr -T     => netman -mtr tcp 
mtr -4     => netman -mtr ipv4
mtr -6     => netman -mtr ipv6
mtr -s 100 => netman -mtr psize 100 
mtr -i 2   => netman -mtr interval 2
mtr -G 10  => netman -mtr gracetime 10
mtr -r     => netman -mtr report
mtr -c 5   => netman -mtr count 5
mtr -n     => netman -mtr nodns 
mtr -z     => netman -mtr aslookup

[mtr help]
 -4                         use IPv4 only 
 -6                         use IPv6 only 
 -u, --udp                  use UDP instead of ICMP echo 
 -T, --tcp                  use TCP instead of ICMP echo 
 -s, --psize PACKETSIZE     set the packet size used for probing
 -i, --interval SECONDS     ICMP echo request interval
 -G, --gracetime SECONDS    number of seconds to wait for responses
 -r, --report               output using report mode
 -c, --report-cycles COUNT  set the number of pings sent
 -n, --no-dns               do not resolve host names
 -z, --aslookup             display AS number
 -h, --help                 display this help and exit
 
 [netman -mtr [help]]
 Usage: netman -mtr [options] hostname
 help                    display this help and exit
 udp                     use UDP instead of ICMP echo 
 tcp                     use TCP instead of ICMP echo 
 ipv4                    use IPv4 only
 ipv6                    use IPv6 only
 psize <SIZE>            set the packet size used for probing
 interval <SECONDS>      ICMP echo request interval
 gracetime <SECONDS>     number of seconds to wait for responses
 report                  output using report mode
 count <COUNT>           set the number of pings sent
 nodns                   do not resolve host names
 aslookup                display AS number
EOF

command="mtr"
hostname=""
if_valid=1

if [ -z $1 ] || [ $1 == "help" ]
then    
    echo "Usage: netman -mtr [options] hostname"
    echo "help                    display this help and exit"
    echo "udp                     use UDP instead of ICMP echo "
    echo "tcp                     use TCP instead of ICMP echo "
    echo "ipv4                    use IPv4 only"
    echo "ipv6                    use IPv6 only"
    echo "psize <SIZE>            set the packet size used for probing"
    echo "interval <SECONDS>      ICMP echo request interval"
    echo "gracetime <SECONDS>     number of seconds to wait for responses"
    echo "report                  output using report mode"
    echo "count <COUNT>           set the number of pings sent"
    echo "nodns                   do not resolve host names"
    echo "aslookup                display AS number"
else
    hostname=${!#}
    for ((i=1; i<$#; i++))
    do
        # echo ${@: $i:1}
        if [ ${@: $i:1} == "udp" ]
        then
            command="$command -u"
        elif [ ${@: $i:1} == "tdp" ] 
        then
            command="$command -T"
        elif [ ${@: $i:1} == "ipv4" ]
        then
            command="$command -4"
        elif [ ${@: $i:1} == "ipv6" ]
        then
            command="$command -6"
        elif [ ${@: $i:1} == "report" ]
        then
            command="$command -r"
        elif [ ${@: $i:1} == "nodns" ]
        then
            command="$command -n"
        elif [ ${@: $i:1} == "aslookup" ]
        then
            command="$command -z"
        elif [ ${@: $i:1} == "psize" ]
        then 
            i=$i+1
            if [ $i -eq $# ] # is in the end
            then
                echo "wrong input: "${@: $i:1}
                if_valid=0
                break
            elif [[ ${@: $i:1} =~ ^[0-9]+$ ]] 
            then
                command="$command -s ${@: $i:1}"
            else # is not number
                echo "wrong input: "${@: $i:1}
                if_valid=0
                break
            fi
        elif [ ${@: $i:1} == "interval" ]
        then
            i=$i+1
            if [ $i -eq $# ] # is in the end
            then
                echo "wrong input: "${@: $i:1}
                if_valid=0
                break
            elif [[ ${@: $i:1} =~ ^[0-9]+$ ]] 
            then
                command="$command -i ${@: $i:1}"
            else # is not number
                echo "wrong input: "${@: $i:1}
                if_valid=0
                break
            fi
        elif [ ${@: $i:1} == "gracetime" ]
        then
            i=$i+1
            if [ $i -eq $# ] # is in the end
            then
                echo "wrong input: "${@: $i:1}
                if_valid=0
                break
            elif [[ ${@: $i:1} =~ ^[0-9]+$ ]] 
            then
                command="$command -G ${@: $i:1}"
            else # is not number
                echo "wrong input: "${@: $i:1}
                if_valid=0
                break
            fi
        elif [ ${@: $i:1} == "count" ]
        then
                    i=$i+1
            if [ $i -eq $# ] # is in the end
            then
                echo "wrong input: "${@: $i:1}
                if_valid=0
                break
            elif [[ ${@: $i:1} =~ ^[0-9]+$ ]] 
            then
                command="$command -c ${@: $i:1}"
            else # is not number
                echo "wrong input: "${@: $i:1}
                if_valid=0
                break
            fi
        else
            echo "wrong input: "${@: $i:1}
            if_valid=0
            break
        fi
    done
    command="${command} ${hostname}"
    if [ if_valid ]
    then
        ${command}
    #else
    #    echo "error"
    fi
fi