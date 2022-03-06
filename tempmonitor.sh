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
	if [ $temp_rounded -gt 70 ]
	then
		now=$(date)
		echo "Temperature is over limit. Shutting of...."
		echo "$now - Temperature $temp over limit 70. Shutting down"
		sleep 1
		shutdown now
		exit 0
	fi
	sleep 1
done
