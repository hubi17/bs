#!/bin/bash

# mpd zu testzwecken. muss durch apache ersetzt werden
# &> bewirkt das ausgabe und fehler umgeleitet werden
ps aux | grep 'mpd' | grep -v 'grep' &> /dev/null
if [ $? -eq 0 ]
then
	echo "Server laeuft"
else
	echo "Server laeuft nicht"
fi
