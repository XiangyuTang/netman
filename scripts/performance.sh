#!/bin/bash
is_netstat_installed=($(dpkg -s net-tools|grep Status))

if [ ${is_netstat_installed[2]} != 'ok' ]
then
	apt-install net-tools
fi

eth_name=$1
host_name=$2

pkt_data=($(netstat -i|grep -w ${eth_name}))
ping_data=$(ping -c 10 ${host_name}|grep ttl)

if [ ${pkt_data} == "" ]
then
	echo "Interface ${eth_name} not found"
else
	rxdrop=${pkt_data[4]}
	rxok=${pkt_data[2]}
	total_rx=$((${rxok} + ${rxdrop}))
	if [ ${total_rx} -gt 0 ]
	then
		loss_pkt=$((${rxdrop} * 100))
		loss_rate=$((${loss_pkt} / ${total_rx}))
	else
		loss_rate=0
	fi
fi
echo ${ping_data}
array=(${ping_data//'\n'/ })
i=0
rtt=0
echo ${array}

for substr in ${array[@]}
do
	imod=$((i % 9))
	if [[ ${imod} == 7 ]]
	then
		time_str=${substr}
 		time=(${time_str//=/ })
		time_int=(${time[1]//./ })
		rtt=$((${rtt} + ${time_int[0]}))
	fi 	
	i=$((${i} + 1))
done

rtt=$((${rtt} * 100))
lr_plus1=$((100 + ${loss_rate}))
lr_minus1=$((100 - ${loss_rate}))
app_rtt=$((${rtt} * ${lr_plus1}))
app_rtt=$((${app_rtt} / ${lr_minus1}))
#all_results=$(python -c 'import subtractrtt; print subtractrtt.subtract('${ping_data}','${loss_rate}')')
#rtt=$(echo $all_results | cut -d' ' -f1)
#app_rtt=$(echo $all_results | cut -d' ' -f2)
echo "LossRate=${loss_rate}% RTT=${rtt}us Application-RTT=${app_rtt}us"
