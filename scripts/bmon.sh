#!/bin/bash

if [ $(whoami) != "root" ]; then
    echo -e "\e[1;31m 请以root权限运行 \e[0m"
    exit
fi

is_bmon_installed=($(dpkg -s bmon|grep Status))
if [ ${is_bmon_installed[2]} != "ok" ]
then
	apt-get install bmon -y 
fi
eth_name=$1
bmon -p ${eth_name}
