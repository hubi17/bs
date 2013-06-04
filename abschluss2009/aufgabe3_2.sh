#!/bin/bash

if [[ -n $1 ]]
then
	FROM=`file -bi $1 | sed -e 's/.*[ ]charset=//'`
	iconv -f $FROM -t utf-8 $1 > $1.u
fi
