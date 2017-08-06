#!/bin/bash

# Copy-paste from android init

if [ ! /dev/wmtWifi ]; then
    mknod /dev/stpwmt c 190 0
    mknod /dev/stpgps c 191 0
    mknod /dev/stpbt  c 192 0
    mknod /dev/wmtWifi c 153 0
    /usr/sbin/wifi_loader
fi

/usr/sbin/6620_launcher -b 4000000 -p /lib/firmware/ -d /dev/ttyMT2

#From now on - just run
#echo 1 > /dev/wmtWifi to enable wireless
