#!/bin/bash

# neuerUser

if [[ -z $1 ]]
then
	useradd -m -g users -s /bin/bash -p $1 $1
fi
