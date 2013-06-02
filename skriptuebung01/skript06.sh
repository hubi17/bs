#!/bin/bash
# wenn das programm unterbrochen wird dann datei loeschen
# 2 = SIGINT - interrupt
# 15 = SIGTERM
# 3 = SIGQUIT
trap 'rm $TMP; exit' 2 15 3
# $$ ist prozess id des laufenden skripts
# datei im home verz anlegen mit nutzerkennung und pid
TMP=$HOME/$USER.$$
# ergebniss von ls -l in datei speichern
ls -l > $TMP
# zeilen der $TMP datei einzeln einlesen
while read ZEILE
do
	# werte von $ZEILE als parameter setzen
	set -- $ZEILE
	# parameter 8 (modifikationszeit) und 9 (datei name) ausgeben
	echo -e "$8 \t $9"
	sleep 1
done < $TMP
