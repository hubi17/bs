#!/bin/bash

rsync -qrlptgoDHAX --exclude=/home/archiv /home/ /var/archiv
