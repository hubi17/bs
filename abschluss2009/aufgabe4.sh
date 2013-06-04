#!/bin/bash

if [[ -n $1 ]]
then
	# verzeichnisse auflisten
	find $1 -type d -exec fuser -v {} +
	# erweiterung 4.2
	find $1 -type d -exec fuser -ik {} +
else
	echo "usage: $0 verzeichnis"
fi
