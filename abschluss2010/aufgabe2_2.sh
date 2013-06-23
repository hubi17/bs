#!/bin/bash

FILE='geburtstagsliste.txt'
TAG=`date +%d`
MONAT=`date +%m`

while read ZEILE
do
	#geburtstag und monat aus datei ermitteln
	GEBURTSTAG=`echo "$ZEILE" | egrep -o '[0-9]{2}/[0-9]{2}'`
	#geburtstag mit aktuellen tag und monat vergleichen
	if [ "$GEBURTSTAG" = "$TAG/$MONAT" ]
	then
		TEXT=`echo "$ZEILE" | egrep -o '[A-Z][A-Za-z[:space:]]+'`
		for i in /dev/pts/*
		do
			#alle terminals die aus zahlen bestehen bestimmen
			if [[ "$i" == *[0-9]* ]]
			then
				#an alle terminals schicken
				echo "Heute ist der $TAG.$MONAT $TEXT" > $i
			fi
		done
	fi
done < $FILE
