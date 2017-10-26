#!/usr/bin/env bash

IMAGE=/tmp/lock.png

scrot ${IMAGE}
convert ${IMAGE} -scale 10% -scale 1000% -blur 0x5 ${IMAGE}

pkill -u ${USER} -USR1 dunst

i3lock --image ${IMAGE} --point default --nofork

pkill -u ${USER} -USR2 dunst
rm ${IMAGE}
