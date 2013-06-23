#!/bin/bash

# in bashrc eintragen
#alias ls='ls --color=auto'

if [[ -z "$1" ]]
then
	find . -mindepth 1 -maxdepth 1 -type d -exec ls --color=auto -d {} \;
else
	# mit du
	if [[ "$1" = "-du" ]]
	then
		# farben auf invers stellen
		echo -e "\033[7m\c"
		find . -mindepth 1 -maxdepth 1 -type d -exec du -hs {} \;
		# farben zuruecksetzen
		echo -e "\033[0m\c"
	fi
fi
