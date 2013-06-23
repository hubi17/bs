#!/bin/bash

# zeile in crontab eintragen
#crontab -e
# danach folgende zeilen einfuegen
30 8 * * * /sbin/vergleich.sh
30 11 * * * /sbin/vergleich.sh
