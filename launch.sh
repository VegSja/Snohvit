#!/bin/bash
cd /home/pi/MagicMirror
./tempmonitor.sh &
sudo -u pi npm start &> /dev/null &
