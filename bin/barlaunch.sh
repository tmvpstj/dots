#!/bin/sh

Clock() {
	TIME=$(date +%H:%M)
	DATE=$(date +%a\ %m/%d/%y)

	echo -n "$TIME on $DATE"
}

while true; do
	echo "%{l}%{F#999999}%{B#101010} $(Clock) %{F-}%{B-}"
	sleep 1
done
