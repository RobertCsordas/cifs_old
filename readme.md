The 4.13 kernel update broke CIFS on some servers. This kernel module is made to work around the problem.

Why?
====

It's important because Meltdown patches are only included in new kernels. Also newer drivers will probably want newer kernels.

Supported kernels
=================

Tested on 4.13, 4.14, 4.15.

Installation
============

Run sudo ./build.sh and reboot. Tested on ArchLinux and Ubuntu.

It will be compiled only for the current kernel, so after every kernel update you'll have to re-run build.sh.

You have to be booted in the new kernel in order for this to work.

Removing
========

You can remove it by deleting /etc/modprobe.d/nocifs.conf and  /etc/modules-load.d/cifs_old.conf files and reboot.

How it works?
=============

It is copied from 4.12, working kernels fs/cifs folder, a custom makefile is added, and some constants are moved to config.h file (because there is no graphical config utility here).
So you'll basically get 4.12 CIFS module on newer kernels.
