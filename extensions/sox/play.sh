#!/bin/sh

# 使用sox解码交给系统gst-launch播放
# zyyme 240125

filename=$1

pkill -9 gst-launch
pkill -9 sox

# 二进制文件写死了路径，sox目录不能重命名
export LD_LIBRARY_PATH=/mnt/us/extensions/sox/library:$LD_LIBRARY_PATH

/mnt/us/extensions/sox/soxi "$filename" > /var/tmp/soxiout
Chan=$(awk -F: '/Channels/ {gsub(" ","");print $2}' /var/tmp/soxiout)
Wide=$(awk -F: '/Precision/ {gsub(" ","");gsub("-bit","");print $2}' /var/tmp/soxiout)
Rate=$(awk -F: '/Sample Rate/ {gsub(" ","");print $2}' /var/tmp/soxiout)
rm /var/tmp/soxiout

# 如有需要，sox可以-v指定音量，1.0是100%
/mnt/us/extensions/sox/sox "$filename" -t raw - |  /usr/bin/gst-launch \
    filesrc location=/dev/stdin \
    ! audio/x-raw-int, \
    endianness='(int)'1234, \
    signed='(boolean)'true, \
    width='(int)'$Wide, \
    depth='(int)'$Wide, \
    rate='(int)'$Rate, \
    channels='(int)'$Chan \
    ! queue \
    ! mixersink

