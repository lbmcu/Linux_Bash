#!/bin/bash

file="rootfs_uclibc.tgz"
dir="rootfs_uclibc"

if [ ! -f "$file" ]
then
	echo '$file is not here!'
	tar zcvf "$file" "$dir"
else
	rm -rf "$file"
	tar zcvf "$file" "$dir"

fi

echo "------------- Begin to make jffs2 rootfs --------------"

rm -rf /home/long/Hi3518EV300/out/wifi_test/rootfs_uclibc_64k.jffs2
./mkfs.jffs2 -d rootfs_uclibc -l -e 0x10000 -o /home/long/Hi3518EV300/out/wifi_test/rooitfs_uclibc_64k.jffs2 

echo "------------- Ending to make jffs2 rootfs --------------"

