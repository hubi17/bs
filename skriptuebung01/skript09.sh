#!/bin/bash

echo -e "Bitte ihre Eingabe: \c"
read EINGABE
echo `echo $EINGABE | tee tstueck.txt`
echo "Sieh dir jetzt die Datei tstueck.txt an"
