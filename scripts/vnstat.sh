#!/bin/bash
# https://vircloud.net/linux/netmo-vnstat.html
is_installed=($(dpkg -s vnstat|grep Status))
if [ ${is_installed[2]} != "ok" ]
then
	apt-get install vnstat vnstati -y 
fi
eth_name=$1
vnstat -i ${eth_name}
