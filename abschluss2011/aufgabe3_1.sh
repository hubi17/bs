#!/bin/bash

# in bashrc eintragen
#alias ls='ls --color=auto'

find . -mindepth 1 -maxdepth 1 -type d -exec ls --color=auto -d {} \;
