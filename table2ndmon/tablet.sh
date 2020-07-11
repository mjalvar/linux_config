#!/bin/sh

gtf 1024 600 60 | grep -oP "\".+"
xrandr --rmmode 1024x600_60.00
xrandr --newmode "1024x600_60.00"  48.96  1024 1064 1168 1312  600 601 604 622  -HSync +Vsync
xrandr --addmode HDMI-2 1024x600_60.00
#xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output HDMI-1 --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-2 --off --output HDMI-2 --mode 1024x600_60.00 --pos 0x1080 --rotate normal
xrandr --output HDMI-2 --mode "1024x600_60.00" --below eDP-1
xhost +
x11vnc -clip 1024x600+0+1080 -noxdamage 


# adb reverse tcp:5900 tcp:5900
# https://blog.8bitbuddhism.com/2019/12/01/how-to-use-your-android-tablet-as-second-monitor/
