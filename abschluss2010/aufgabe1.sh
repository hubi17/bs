#!/bin/bash

if [ ! -z $1 ]
then
	case "$1" in
		"ein")
			setfacl -Rx "u:evi:
			;;
		"aus")
			;;
		*)
		echo "aufruf: $0 ein | aus"
		;;
	esac
else
	echo "aufruf: $0 ein | aus"
fi
