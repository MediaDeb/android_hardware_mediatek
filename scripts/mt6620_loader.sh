#!/bin/bash
if [ ! -e /dev/wmtWifi ]; then
    mknod /dev/stpwmt c 190 0
    mknod /dev/stpgps c 191 0
    mknod /dev/stpbt  c 192 0
    mknod /dev/wmtWifi c 153 0
    /usr/sbin/wifi_loader
fi
exit 0
