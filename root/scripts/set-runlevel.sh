#! /bin/bash
#
# Script to set the run level at boot.  There are two options for this script:
#   -g | --graphical: Set the boot mode to the graphical login.
#   -t | --terminal:  Set the boot mode to terminal.
#
# Written by Rick Hoover on February 16th, 2019

mode=

usage()
{
	echo "usage: $0 [option]"
	echo "  where option is:"
	echo "  -g | --graphical: Set default boot to graphical login"
	echo "  -t | --terminal:  Set default boot to terminal mode"
}

if [ "$1" == "" ]; then
	usage
	exit 1
fi

while [ "$1" != "" ]; do
	case $1 in
		-g | --graphical ) mode="g"
		                   ;;
		-t | --terminal )  mode="t"
		                   ;;
		-h | --help )      usage
		                   exit
		                   ;;
		* )                usage
		                   exit 1
	esac
	shift
done

if [ "$mode" == "t" ]; then
	echo "Setting default boot to terminal mode."
	systemctl enable multi-user.target
	systemctl set-default multi-user.target
fi

if [ "$mode" == "g" ]; then
	echo "Setting default boot to graphical login."
	systemctl enable graphical.target
	systemctl set-default graphical.target
fi
