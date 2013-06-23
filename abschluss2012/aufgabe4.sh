#!/bin/bash

NAME=""
VORNAME=""
GEBURTSDATUM=""
LOGIN=""
LISTE="Benutzerliste.csv"

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
dialeingabe "Bitte geben Sie ihren Geburtstag ein (TT.MM.JJJJ):" "^((([0][1-9])|([1-2][0-9]))|([3][0-1]))[.](([0][1-9])|([1][0-2]))[.](([1][9][0-9][0-9])|([2][0][0][0-9])|([2][0][1][0-3]))$"
GEBURTSDATUM=$wert
clear
ok=0
dialeingabe "Bitte geben Sie ihren Login ein" "^[a-z]+"
LOGIN=$wert
clear
ok=0

# pruefung ob schon vorhanden
while read ZEILE
do
	IFS=","
	set -- $ZEILE
	if [[ $1 = $NAME ]] && [[ $2 = $VORNAME ]] && [[ $3 = $GEBURTSDATUM ]] && [[ $4 = $LOGIN ]]
	then
		ok=9
		break
	fi
done < $LISTE
IFS=" "

if [[ $ok != 9 ]]
then
	echo "$NAME,$VORNAME,$GEBURTSDATUM,$LOGIN" >> "$LISTE"
else
	echo "Eintrag vorhanden"
fi
