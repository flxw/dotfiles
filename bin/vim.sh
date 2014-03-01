#!/bin/sh

if echo $1 | grep -q '.tex'; then
    vim --servername VIM "$@"
else
    vim "$@"
fi
