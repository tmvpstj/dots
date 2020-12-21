#!/bin/sh

Clock() {
	TIME=$(date +%H:%M:%S)
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

while true; do
	echo "%{l}%{F#999999}%{B#101010} $(Clock) | $(volume) %{F-}%{B-}"
	sleep .1
done
