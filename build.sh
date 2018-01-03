#!/bin/bash
make clean
make
cp cifs_old.ko /lib/modules/extramodules-$(uname -r|sed 's/\./ /g'|awk '{print $1"."$2}')-ARCH/
depmod
echo "blacklist cifs" > /etc/modprobe.d/nocifs.conf
echo "cifs_old" > /etc/modules-load.d/cifs_old.conf