#!/bin/sh
# zyyme 240125
iptables -I INPUT -j ACCEPT

eips 7 1 "IP: `ifconfig wlan0 | grep 'inet addr' | awk -F '[ :]' '{print $13}'`"
cd `dirname $0`
./workdayAlarmClock-linux-arm kindle </dev/null >/dev/null 2>&1 > /dev/null
