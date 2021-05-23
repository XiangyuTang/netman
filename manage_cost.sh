#!/bin/bash
is_bmon_installed=($(dpkg -s bmon|grep Status))
if [ ${is_bmon_installed[2]} == "ok" ]
then
	echo "The dependency has been installed."
else
	apt-get install bmon 
fi
eth_name=$1
bmon -p ${eth_name}
echo "Bash exec finished."
