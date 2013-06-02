#!/bin/bash

zeit() {
	# date befehl ausgabe als parameter setzten
	set `date`
	# trennzeichen zwischen parameter als ":" festlegen
	IFS=":"
	# vierten parameterteil von date == uhrzeit als neuen parameter festlegen
	set $4
	# trennzeichen zurueck auf " " setzen
	IFS=" "
	# ausgabe von uhrzeit in std:min:sek ausgeben
	echo "$1:$2:$3";
}

echo "Start der Prozedur $0 um `zeit`"
i=0
while [[ $i -lt 20 ]]
do
	# erhoehung von i in einer sub-shell
	((i = i + 1))
	sleep 1
done
echo "Ende der Prozedur $0 um `zeit`"
