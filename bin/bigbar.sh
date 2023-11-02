#!/bin/sh

Clock() {
	TIME=$(date +%I:%M:%S)
	DATE=$(date "+%a, %b %d")

	echo -n "$TIME on $DATE"
}

volume() {
	VOLUME=$(pamixer --get-volume-human)
	if [ $VOLUME = muted ]
	then
		REALVOLUME=" 0%"
	else
		REALVOLUME=$(pamixer --get-volume-human)
	fi

	echo -n "$REALVOLUME"
}

tags() {
	for i in 0 1 2 3 4 5 6 7 8 9; do
		printf "%s" "%{A: herbstclient use_index $i:} $(($i+1)) %{A} ";
	done
}

# wifi() {
	# while true; do
		# echo $(iw wlan0 info | grep -oP '(?<=ssid ).*$')
		# sleep 10
	# done
# }

while true; do
	echo "%{F#f8f8f8}%{B#0e0e0e} %{l}%{A:rofi -show drun:}  %{A} \
	$(tags) \
	%{A:herbstclient floating toggle:} F %{A} \
	%{r} $(Clock) |%{A4:pamixer -i 5:}%{A5:pamixer -d 5:}  $(volume) %{A}%{A}%{F-}%{B-}"
	sleep .5
done
