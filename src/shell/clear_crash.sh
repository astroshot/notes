#!/bin/sh

echo 'list Crash logs:'
ls -lh ~/Library/Logs/DiagnosticReports
echo 'rm those crash logs? y/n'
read choice
if [ "$choice" = "y" -o "$choice" = "Y" ]; then
    rm -v ~/Library/Logs/DiagnosticReports/*.crash
else
    exit
fi
