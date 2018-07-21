#!/usr/bin/env sh

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

filename=$(basename $1)
output_file="$HOME/Desktop/push/${filename}"
echo ${output_file}
sort $1 | uniq > ${output_file}
