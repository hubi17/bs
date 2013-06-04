#!/bin/bash

if [[ -n "$1" ]]
then
	echo `file -bi $1 | sed -e 's/.*[ ]charset=//'`
else
	echo "Usage $0 filename"
fi
