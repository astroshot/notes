#!/bin/sh
set -x

cwd=$(pwd)
files=$(ls $cwd)

for dir in $files; do
    # echo $cwd/$dir
    if [ -d $cwd/$dir ]; then
        cd $cwd/$dir
        git reset --hard origin/$(git_current_branch)
        cd ..
    fi
done

set +x
