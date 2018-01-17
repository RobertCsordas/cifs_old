#!/bin/bash

if (( $EUID != 0 )); then
	echo "Please run as root"
	exit
fi

if [[ `uname -r|grep ARCH` == "" ]]; then
	apt-get install linux-headers-$(uname -r)
else
	pacman -Sy linux-headers
fi

make clean
make
if [[ `uname -r|grep ARCH` != "" ]]; then
	cp cifs_old.ko /lib/modules/extramodules-$(uname -r|sed 's/\./ /g'|awk '{print $1"."$2}')-ARCH/
else
	cp cifs_old.ko /lib/modules/$(uname -r)/kernel/fs
fi
depmod
echo "blacklist cifs" > /etc/modprobe.d/nocifs.conf
echo "cifs_old" > /etc/modules-load.d/cifs_old.conf