#!/bin/bash
make clean
make
if [[ `uname -r|grep ARCH` == "" ]]; then
	cp cifs_old.ko /lib/modules/extramodules-$(uname -r|sed 's/\./ /g'|awk '{print $1"."$2}')-ARCH/
else
	cp cifs_old.ko /lib/modules/$(uname -r)/kernel/fs
fi
depmod
echo "blacklist cifs" > /etc/modprobe.d/nocifs.conf
echo "cifs_old" > /etc/modules-load.d/cifs_old.conf