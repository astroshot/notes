#!/usr/bin/env bash

if [ $# -lt 1 ]
then
    echo "No input file!"
    exit
fi

if [ ! -f $1 ]
then
    echo "File $1 does not exist!"
    exit
fi

sort $1 | uniq
