#!/bin/sh

# adjust resolution

set -x
xrandr --newmode "1920x1080" $(cvt 1920 1080 | sed '1d' | sed 's/Modeline "1920x1080_60.00"//')
xrandr --addmode Virtual-1 1920x1080
xrandr --output Virtual-1 --mode 1920x1080

