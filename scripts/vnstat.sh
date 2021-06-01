#!/bin/bash
# https://vircloud.net/linux/netmo-vnstat.html
if [ $(whoami) != "root" ]; then
    echo -e "\e[1;31m 请以root权限运行 \e[0m"
    exit
fi

is_installed=($(dpkg -s vnstat|grep Status))
if [ ${is_installed[2]} != "ok" ]
then
	apt-get install vnstat vnstati -y 
fi
eth_name=$1
vnstat -i ${eth_name}
