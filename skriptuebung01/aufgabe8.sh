#!/bin/bash

# dateien finden die in gewissen verzeichnissen liegen und softlinks nach home/user/links anlegen
if [[ -n $1 ]]
then
	find /{bin,boot,dev,etc,media} -user $1 -exec ln -s {} /home/$1/links/ \; 2> /dev/null
fi

# wenn original datei geloescht wird, zeigen links ins leere


# dateien in windows mounts mit namen "autoexec.bat" finden
find /{mnt.media} -name 'autoexec.bat' 2> /dev/null
