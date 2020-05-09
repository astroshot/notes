#!/bin/sh

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar mybar >>/tmp/polybar.log 2>&1 &

echo 'polybar launched'
