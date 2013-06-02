#!/bin/bash

if [[ "$1" != "" ]]
then
	zu=`crypt($1,$1$12345678)`
	echo $zu
fi
