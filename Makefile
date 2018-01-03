#
# Makefile for Linux CIFS VFS client 
#
obj-m += cifs_old.o
cifs_old-objs := cifsfs.o cifssmb.o cifs_debug.o connect.o dir.o file.o inode.o \
	  link.o misc.o netmisc.o smbencrypt.o transport.o asn1.o \
	  cifs_unicode.o nterr.o cifsencrypt.o \
	  readdir.o ioctl.o sess.o export.o smb1ops.o winucase.o \
	  xattr.o cifsacl.o cifs_spnego.o dns_resolve.o cifs_dfs_ref.o fscache.o cache.o \
	  smb2ops.o smb2maperror.o smb2transport.o \
	  smb2misc.o smb2pdu.o smb2inode.o smb2file.o

all:
	make -C /lib/modules/$(shell uname -r)/build/ M=$(PWD) modules
clean:
	make -C /lib/modules/$(shell uname -r)/build/ M=$(PWD) clean