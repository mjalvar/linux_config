#!/usr/bin/env bash

source "$HOME/.cache/wal/colors.sh"

background='#0F0F0F'
#background='argb:c82d303b'

#                   'background', 'border', 'separator'
rofi="rofi -combi-modi window,drun -show combi \
     -color-window '$background, $background, $color1' \
     -color-normal '$background, $foreground, $background, $color1, $background' \
     -color-active '$background, $foreground, $background, $color1, $background' "
echo $rofi
