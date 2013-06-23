#!/bin/bash

nmap -p 631 localhost | grep 'closed' &> /dev/null

if [[ $? == 0 ]]
then
	echo "Druckserver laeuft nicht"
else
	echo "Druckserver laeuft"
fi
