#!/bin/bash

# script variables
PIC_DIR="/home/$USER/backgrounds"

FILES=(`/bin/ls $PIC_DIR/*.{jpg,png}`) 
RANGE=${#FILES[@]}
INDEX=$RANDOM

# script functions
function getRandomFile() {
    while [ ! -e "${FILES[$INDEX]}" ]; do
        INDEX=`expr $RANDOM % $RANGE`
    done

    echo "${FILES[$INDEX]}"
}


feh --bg-fill $(getRandomFile)
