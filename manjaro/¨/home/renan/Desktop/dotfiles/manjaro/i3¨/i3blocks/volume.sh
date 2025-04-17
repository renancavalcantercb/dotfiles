#!/bin/bash
vol=$(amixer get Master | grep -o '[0-9]*%' | head -1)
mute=$(amixer get Master | grep '\[off\]')
icon=""
[ -n "$mute" ] && icon=""
echo "$icon $vol"
