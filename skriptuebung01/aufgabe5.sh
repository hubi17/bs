#!/bin/bash

who -q | grep users | cut -d '#' -f 2

if [[ -z $1 ]]
then
	userdel -r $1
fi
