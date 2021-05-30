#!/bin/bash
# https://www.jeddd.com/article/linux-fancy-text-generator.html
# Netman字符画生成

is_installed=($(dpkg -s figlet|grep Status))
if [ ${is_installed[2]} != "ok" ]
then
	apt install figlet -y
fi
echo "Welcome to the Network Manager!"
figlet Netman
echo "Copyright © 2021 THU. All rights reserved."
