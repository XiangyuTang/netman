#!/bin/bash
if [ $(whoami) != "root" ];
then
    echo -e "\e[1;31m 请以root权限运行 \e[0m"
    exit
fi
is_installed=($(dpkg -s ufw|grep Status))
if [ ${is_installed[2]} != "ok" ]
then
	apt install ufw
fi
if [ $1 == "open" ]
then
	ufw enable
elif [ $1 == "close" ]
then
	ufw disable
elif [ $1 == "status" ]
then
	ufw status
elif [ $1 == "allow" ]
then
	for i in $*
	do
	if [ $i != "allow" ]
	then ufw allow $i
	fi
	done
elif [ $1 == "deny" ]
then
	for i in $*
	do
	if [ $i != "deny" ]
	then ufw deny $i
	fi
	done
elif [ $1 == "reset" ]
then 
	echo y|ufw reset
else
	echo "wrong input"
fi
