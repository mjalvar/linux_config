#!/bin/bash
ICON=$HOME/Config/i3/lock.png
TMPBG=/tmp/screen.png
scrot -o $TMPBG
convert $TMPBG -scale 10% -scale 1000% $TMPBG
convert $TMPBG $ICON -gravity center -composite -matte $TMPBG
i3lock -i $TMPBG
