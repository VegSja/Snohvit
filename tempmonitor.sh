#!/bin/bash
if [[ $UID != 0 ]]; then
	echo "Please run script as sudo"
	exit 1
fi

echo "TEMPMONITOR: Everything is running...."

while true
do
	temp=$(vcgencmd measure_temp | egrep -o '[0-9]*\.[0-9]*')
	temp_rounded=${temp%%.*} 
	if [ $temp_rounded -gt 60 ]
	then
		echo "Temperature is over limit. Shutting of...."
		sleep 1
		shutdown now
		exit 0
	fi
	sleep 1
done
