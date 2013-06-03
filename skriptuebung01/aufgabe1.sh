#!/bin/bash

pid=`ps ax | grep -i "$1" | grep -v grep | cut -d " " -f 2`
pid=`echo $pid | cut -d " " -f 1`
kill -9 $pid
