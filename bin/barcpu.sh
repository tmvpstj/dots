#!/bin/sh

cpuusage() {
	echo "cpu is at $(top -b -n 1 | grep Cpu | awk '{print $2+$4+$6+$10+$12+$14}')"
}

while true; do
	echo "%{l}%{F#999999}%{B#101010} $(cpuusage) %{F-}%{B-}"
	sleep 1
done
