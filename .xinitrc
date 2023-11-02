#!/bin/sh

xrandr --output DisplayPort-1 --primary --mode 2560x1440
picom &
~/bin/wlpset &
xrdb -load ~/.Xresources &
# ~/bin/bigbar.sh | lemonbar -g 2560x30+1920+0 -b -f "Fantasque Sans Mono:normal:size=10"| sh &
# ~/bin/barcpu.sh | lemonbar -g 140x30+1285+15 -B '#101010' -b -f "SF Mono:normal:size=10" &
# pgrep -x sxhkd || sxhkd -c ~/etc/sxhkd/sxhkdrc &
# xinput set-button-map 12 1 2 3 4 5 6 7 6 7 &
# pgrep -x pulseaudio || pulseaudio --daemonize &
# st &
pipewire &
pipewire-pulse &
wireplumber &
exec herbstluftwm
