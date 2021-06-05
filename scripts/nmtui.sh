#!/bin/bash
is_nmtui_installed=($(dpkg -s network-manager|grep Status))
if [ ${is_nmtui_installed[2]} != "ok" ]
then	
	apt-get install network-manager
fi
nmtui
