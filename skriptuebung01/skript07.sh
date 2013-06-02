#!/bin/bash

# funktion zur darstellung einer dialog box die nur eingaben zulaesst
# die den uebergebenen regulaeren ausdruck entsprechen
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
# kein plan was das $hallo macht. es wird so aber nicht nach den namen gefragt
#$hallo=dialeingabe "Bitte geben Sie einen Namen ein" "^[A-Z]{1}[a-z]+"
dialeingabe "Bitte geben Sie einen Namen ein" "^[A-Z]{1}[a-z]+"
name=$wert
clear
ok=0
dialeingabe "Bitte geben Sie eine PLZ ein (D-*****):" "^[DFIdfi]{1}[-]{1}[0-9]{5}$"
plz=$wert
clear
ok=0
dialeingabe "Bitte geben Sie ihren Geburtstag ein (TT.MM.JJJJ):" "^((([0][1-9])|([1-2][0-9]))|([3][0-1]))[.](([0][1-9])|([1][0-2]))[.](([1][9][0-9][0-9])|([2][0][0][0-4]))$"
datum=$wert
clear
echo "Die Eingaben waren: $name $plz $datum $hallo"
echo "$hallo"
