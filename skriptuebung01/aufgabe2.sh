#!/bin/bash

df -hl --total | tr -s ' ' | cut -d " " -f 5
