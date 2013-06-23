#!/bin/bash

rsync -qrlptgoDHAX /home/ /var/archiv

# zusaetzlich eintrag im crontab
#0 18 * * 5 /sbin/backup.sh
