#!/bin/sh
# zyyme 240125
killall workdayAlarmClock-linux-arm
killall find
pkill -9 gst-launch
pkill -9 sox

iptables-restore; /etc/sysconfig/iptables && iptables -I INPUT -p tcp --dport 22 -j ACCEPT
dd if=/dev/zero of=/dev/fb0