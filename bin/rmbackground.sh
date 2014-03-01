#!/bin/sh

BGFILE=`cat ~/.fehbg | grep -o '/.*\....'`

if rm "$BGFILE"; then
    echo "`basename $0`: successfully removed $BGFILE"
else
    echo "`basename $0`: failed to remove $BGFILE"
    exit 1
fi
