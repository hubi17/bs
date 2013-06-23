#!/bin/bash

# eintrag in crontab
#*/5 * * * * /sbin/druckservertest.sh

nmap -p 631 localhost | grep 'closed' &> /dev/null

if [ $? == 0 ]
then
	DATUM=`date +%d.%m.%Y`
	ZEIT=`date +%H:%M`
	echo "Druckserver am $DATUM um $ZEIT Uhr nicht betriebsbereit" > /var/log/Druckserver.log
fi
