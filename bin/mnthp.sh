#!/bin/sh

cd $HOME/..
jmtpfs -o allow_other android/ > /dev/null 2>&1

if ! ls android > /dev/null 2>&1; then
    fusermount -u android
    echo "Change Android operating mode to and back from media device!"
    exit 1
fi
