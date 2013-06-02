#!/bin/bash

# test: string laenge == 0
if [[ -z $1 ]]
then
	echo "Bitte Parameter mit eingeben!"
	echo "Er fehlt hier => Abbruch!"
	exit 1
fi

# test: datei existiert und ist verzeichnis
if [[ -d $1 ]]
then
	ls -lisah --color $1 | more 
else
	# test: and - macht hier irgendwie kein sinn
	if [[ -a $1 ]]
	then
		# test: datei existiert und leserechte
		if [[ -r $1 ]]
		then
			less $1 # more finde ich hier behindert
		else
			echo "Diese Datei ist nicht fuer Sie gedacht"
		fi
	else
		echo "Es gibt die Datei $1 nicht!"
	fi
fi
