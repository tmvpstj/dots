#!/bin/sh

Clock() {
	TIME=$(date +%I:%M:%S)
	DATE=$(date +%a\ %m/%d/%y)

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

	echo -n "volume $REALVOLUME"
}

# wifi() {
	# while true; do
		# echo $(iw wlan0 info | grep -oP '(?<=ssid ).*$')
		# sleep 10
	# done
# }

while true; do
	echo "%{l}%{F#f8f8f8}%{B#0e0e0e} %{A:rofi -show drun:} rofi %{A}                                                                                                                                                                                                                                                                                                                           $(Clock) | $(volume)    %{F-}%{B-}"
	sleep .1
done
