#!/bin/sh
# zyyme 240125
curl http://127.0.0.1:8080/stop
pkill -9 gst-launch
pkill -9 sox