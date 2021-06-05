#!/bin/bash
is_nmtui_installed=($(dpkg -s nmtui|grep Status))
if [ ${is_nmtui_installed[2]} == "ok" ]
then
	echo "The dependency has been installed."
else
	apt-get install bmon 
fi
nmtui
echo "Bash exec finished."
