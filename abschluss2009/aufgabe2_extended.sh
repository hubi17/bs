#!/bin/bash

NAME=""
VORNAME=""
STRASSE=""
PLZ=""
ORT=""
LISTE="adressen.csv"

touch $LISTE

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

ok=0

dialeingabe "Bitte geben Sie einen Namen ein" "^[A-Z]{1}[a-z]+"
NAME=$wert
clear
ok=0
dialeingabe "Bitte geben Sie einen Vornamen ein" "^[A-Z]{1}[a-z]+"
VORNAME=$wert
clear
ok=0
dialeingabe "Bitte geben Sie eine Strasse und Haus Nr ein" '^[A-Z]{1}[a-z[:space:]]+[[:space:]][1-9]{1}[0-9]*'
STRASSE=$wert
clear
ok=0
dialeingabe "Bitte geben Sie eine PLZ ein (D-*****):" "^[DFIdfi]{1}[-]{1}[0-9]{5}$"
PLZ=$wert
clear
ok=0
dialeingabe "Bitte geben Sie einen Ort ein:" '^[A-Z]{1}[a-z]+'
ORT=$wert
clear

# pruefung ob schon vorhanden
while read ZEILE
do
	IFS="|"
	set -- $ZEILE
	if [[ $1 = $NAME ]] && [[ $2 = $VORNAME ]] && [[ $3 = $STRASSE ]] && [[ $4 = $PLZ ]] && [[ $5 = $ORT ]]
	then
		ok=9
		break
	fi
done < $LISTE
IFS=" "

if [[ $ok != 9 ]]
then
	echo "$NAME|$VORNAME|$STRASSE|$PLZ|$ORT" >> "$LISTE"
else
	echo "Eintrag vorhanden"
fi
