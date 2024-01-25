#!/bin/sh
# zyyme 240125
eips 7 1 "IP: `ifconfig wlan0 | grep 'inet addr' | awk -F '[ :]' '{print $13}'`"
cd `dirname $0`
./workdayAlarmClock-linux-arm ./play.sh  > /dev/null
