#!/bin/bash

DATEI="geburtstagsliste.txt"

function dialeingabe {
while [[ "$ok" == "0" ]]
do
	if [[ -z "$1" ]]
	then
		set "Bitte Wert eingeben:"
	fi
	dialog --inputbox "$1" 0 0 2> ./temp$$
	if [[ "$?" != "0" ]]
	then
		clear
		return 7
		exit 0
	fi
	wert=`cat ./temp$$`
	rm ./temp$$
	if echo $wert | egrep $2 > /dev/null
	then
		ok=1
	fi
done
}

function datumseingabe {
if [[ -z "$1" ]]
then
	set "Bitte Datum eingeben:"
fi
dialog --calendar "$1" 0 0 2> ./temp$$
if [[ "$?" != "0" ]]
then
	clear
	return 7
	exit 0
fi
wert=`cat ./temp$$`
rm ./temp$$
}

ok=0
datumseingabe "Bitte Geburtsdatum eingeben"
DATUM=$wert

ok=0
dialeingabe "Bitte geben sie einen Namen ein" "^[A-Z]{1}[a-z[:space:]]+"
NAME=$wert

echo "$DATUM $NAME" >> $DATEI
