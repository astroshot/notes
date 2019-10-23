#!/bin/sh

set -x
cwd=$(pwd)

files=$(ls $cwd)

for dir in $cwd/$files; do
    # echo $cwd/$dir
    if [ -d $cwd/$dir ]; then
        # cd $cwd/$dir
        if [ -f $cwd/$dir/.factorypath ]; then
            rm $cwd/$dir/.factorypath
        fi
        if [ -f $cwd/$dir/.project ]; then
            rm $cwd/$dir/.project
        fi
        if [ -f $cwd/$dir/.classpath ]; then
            rm $cwd/$dir/.classpath
        fi
    fi
done

set +x
