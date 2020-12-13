#!/bin/sh

volume() {
	VOLUME=$(pamixer --get-volume-human)

	echo -n "volume is $VOLUME"
}

while true; do
	echo "%{l}%{F#999999}%{B#101010} $(volume) %{F-}%{B-}"
	sleep 1
done
