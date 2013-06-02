#!/bin/bash

if [[ "$1" != "" ]]
then
	# mit dem aufruf geht es bei mir unter arch nicht
	#zu=`crypt($1,$1$12345678)`
	# aber mit folgender aenderung laeufts
	zu=$(perl -e 'print crypt($1, "password")' $1)
	echo $zu
fi
