#!/bin/bash
is_bmon_installed=($(dpkg -s bmon|grep Status))
if [ ${is_bmon_installed[2]} != "ok" ]
then
	apt-get install bmon -y 
fi
eth_name=$1
bmon -p ${eth_name}
