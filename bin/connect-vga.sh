#!/bin/sh

LOCKFILE=/tmp/vga-connected-$USER
DOCK_ID="17ef:100a Lenovo ThinkPad Mini Dock Plus Series 3"

if [ ! -e $LOCKFILE ]; then
    if lsusb | grep -q "$DOCK_ID"; then
        # ramp up different monitors if we are docked
        xrandr --output VGA1 --auto
        xrandr --output LVDS1 --off
        xrandr --output HDMI3 --auto --right-of VGA1
        touch $LOCKFILE
    elif xrandr | grep -q 'VGA1 connected'; then
        # now that we are not docked, simply behave as if an external
        # monitor was connected
        xrandr --output LVDS1 --auto
        xrandr --output VGA1 --left-of LVDS1 --auto
        touch $LOCKFILE
    fi
else
    xrandr --output HDMI3 --off
    xrandr --output LVDS1 --auto
    xrandr --output VGA1 --off
    rm $LOCKFILE
fi

# force conky to rescale its output
/bin/kill -SIGUSR1 `pidof conky`
