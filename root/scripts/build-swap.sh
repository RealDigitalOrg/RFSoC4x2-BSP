#! /bin/bash
#
# Script to build 1 GByte swapfile in root.
# Written by Rick Hoover on November 24th, 2017

expand=
swapfile="/swapfile"

usage()
{
	echo "usage: $0 [--expand]"
}

while [ "$1" != "" ]; do
	case $1 in
		-e | --expand ) expand=1
		                ;;
		-h | --help )   usage
		                exit
		                ;;
		* )             usage
		                exit 1
	esac
	shift
done

if [ "$expand" == "1" ]; then
	echo "Expanding file system, please wait ..."
	./resize.sh /dev/mmcblk0 p2 apply
	resize2fs /dev/mmcblk0p2
fi

if [ -f $swapfile ]; then
	echo "Swap file exists"

else
	echo "Creating swap file, please wait ..."
	dd if=/dev/zero of=/swapfile bs=1024 count=1048576
	mkswap -L swap /swapfile
	chmod 600 /swapfile
	swapon -a
fi
