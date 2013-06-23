#!/bin/bash

# rechte fuer igenieure
#setfacl -m "g:ingenieur:rx" /home/archiv/
#setfacl -Rm "g:ingenieur:rx" /home/kosten/
#setfacl -Rm "g:ingenieur:rx" /home/archiv/briefe/
#setfacl -Rm "g:ingenieur:rwx" /home/projekte/

# rechte fuer kaufmaenische evi
#setfacl -Rm "g:kauf:wx" /home/archiv/
#setfacl -Rm "g:kauf:wx" /home/kosten/
#setfacl -m "g:kauf:wx" /home/projekte/
#setfacl -Rm "g:kauf:wx" /home/projekte/erfassen/

# rechte fuer fritz
#setfacl -Rm "u:fritz:rwx" /home/archiv/
#setfacl -Rm "u:fritz:rwx" /home/kosten/
#setfacl -Rm "u:fritz:rwx" /home/projekte/
if [[ ! -z $1 ]]
then
	case "$1" in
		"ein")
			echo "ein"
			setfacl -x "g:ingenieur" /home/archiv/
			setfacl -Rx "g:ingenieur" /home/kosten/
			setfacl -Rx "g:ingenieur" /home/archiv/briefe/
			setfacl -Rx "g:ingenieur" /home/projekte/

			setfacl -Rx "g:kauf" /home/archiv/
			setfacl -Rx "g:kauf" /home/kosten/
			setfacl -x "g:kauf" /home/projekte/
			setfacl -Rx "g:kauf" /home/projekte/erfassen/
			;;
		"aus")
			echo "aus"
			setfacl -m "g:ingenieur:rx" /home/archiv/
			setfacl -Rm "g:ingenieur:rx" /home/kosten/
			setfacl -Rm "g:ingenieur:rx" /home/archiv/briefe/
			setfacl -Rm "g:ingenieur:rwx" /home/projekte/

			setfacl -Rm "g:kauf:wx" /home/archiv/
			setfacl -Rm "g:kauf:wx" /home/kosten/
			setfacl -m "g:kauf:wx" /home/projekte/
			setfacl -Rm "g:kauf:wx" /home/projekte/erfassen/
			;;
		*)
			echo "aufruf: $0 ein | aus"
			;;
	esac
else
	echo "aufruf: $0 ein | aus"
fi
