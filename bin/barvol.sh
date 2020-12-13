#!/bin/sh

volume() {
	VOLUME=$(pamixer --get-volume-human)
	if [ $VOLUME = muted ]
	then
		REALVOLUME=" 0%"
	else
		REALVOLUME=$(pamixer --get-volume-human)
	fi

	echo -n "volume is $REALVOLUME"
}

while true; do
	echo "%{l}%{F#999999}%{B#101010} $(volume) %{F-}%{B-}"
	sleep .1
done
