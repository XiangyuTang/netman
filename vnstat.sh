#!/bin/bash
# https://vircloud.net/linux/netmo-vnstat.html
is_installed=($(dpkg -s vnstat|grep Status))
if [ ${is_installed[2]} == "ok" ]
then
	echo "The dependency has been installed."
else
	apt-get install vnstat vnstati -y 
fi
eth_name=$1
vnstat -i ${eth_name}
echo "exec finished."
