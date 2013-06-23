#!/bin/bash

STARTH="7"
STARTM="00"
BEGINH=`date "+%_H"`
BEGINM=`date "+%M"`

echo "$(($BEGINH-$STARTH)) Stunden und $(($BEGINM-$STARTM)) Minuten Verspaetung"
