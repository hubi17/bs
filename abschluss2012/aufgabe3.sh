#!/bin/bash

killall -9 firefox
killall -9 iceweasel
killall -9 mozilla
killall -9 chromium

iptables -A INPUT -p tcp -i eth0 --dport 80 -j DROP
