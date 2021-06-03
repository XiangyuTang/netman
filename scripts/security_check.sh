#!/bin/bash
if [ $(whoami) != "root" ];
then
    echo -e "\e[1;31m 请以root权限运行 \e[0m"
    exit
fi
is_installed=$(dpkg -s net-tools|grep Status)
if [ ${is_installed[2]} != "ok" ]
then
	apt install net-tools
fi
dangerport=$(netstat -anltp | awk '{print $4}'|sed 's/:/ /g'|awk '{print $2}'|sort |uniq)
echo 当前系统监听端口:$dangerport
find=0
for i in $(cat ./scripts/danger.port)
do
    port=`echo $i | awk -F: '{print $1}'`
    type=`echo $i | awk -F: '{print $2}'`
    result=$(echo $dangerport | grep -w "$port")
    # if [[ $dangerport =~ $port ]]
    if [[ $result != "" ]]
    then
        find=1
        echo "存在高危端口:${port},威胁原因:${type}"
    fi
done
if [ ${find} == 0 ]
then 
    echo -e 没有发现危险端口
fi