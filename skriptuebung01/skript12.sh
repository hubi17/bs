#!/bin/bash

function aendern {
if [[ "$wahl" == "0" || "$wahl" == "7" ]]
then
	break
fi
cat ./daten.csv | grep "$suche\>" > ./temp$$
ausgabe=`cat ./temp$$`
rm -r ./temp$$
cat ./daten.csv | grep -v "$suche\>" > ./dat.csv
IFS="|"
set $ausgabe

dialog --inputbox "Geben Sie den neuen Wert ein:" 0 0 2> ./temp$$
AENDERUNG=`cat ./temp$$`
rm ./temp$$
IFS=" "
mv .dat.csv ./daten.csv
case $wahl in
	1)
		echo "$AENDERUNG|$2|$3|$4|$5|$6" >> ./daten.csv
		;;
	2)
		echo "$1|$AENDERUNG|$3|$4|$5|$6" >> ./daten.csv
		;;
	3)
		echo "$1|$2|$AENDERUNG|$4|$5|$6" >> ./daten.csv
		;;
	4)
		echo "$1|$2|$3|$AENDERUNG|$5|$6" >> ./daten.csv
		;;
	5)
		echo "$1|$2|$3|$4|$AENDERUNG|$6" >> ./daten.csv
		;;
	6)
		echo "$1|$2|$3|$4|$6|$AENDERUNG" >> ./daten.csv
		;;
esac
rm -r ./temp$$
}
