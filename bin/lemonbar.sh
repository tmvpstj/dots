#!/bin/bash

herbstclient -i |
while read line; do

    case $line in
    window_title_changed*)
		wnd_title=$(echo $line | awk '{$1=$2=""; print $0}' | cut -c 1-150)
        ;;
    focus_changed*)
		wnd_title=$(echo $line | awk '{$1=$2=""; print $0}' | cut -c 1-150)
        ;;

    tag_changed*)
		wm_infos=()
		TAGS=( $(herbstclient tag_status) )
        for i in "${TAGS[@]}" ; do
		# if [[ $i != *8 ]]; then
			index=${i:1:1}
			case ${i:0:1} in
			':'*) # tag has windows
				wm_infos+="%{A:herbstclient use_index $(($index-1)):} ${i:1:1} %{A}"
				;;
			
			'#'*) # tag is focused
				wm_infos+="%{+u} ${i:1:1} %{-u}"
				;;

			'.'*) # tag is empty and unfocused
				wm_infos+="%{A:herbstclient use_index $(($index-1)):}%{F#666666} ${i:1:1} %{F-}%{A}"
				;;
			
			'-'*) # tag is viewed on other, unfocused monitor
				wm_infos+="%{+u}%{A:herbstclient use_index $(($index-1)):}%{F#b0b0ff} ${i:1:1} %{F-}%{A}%{-u}"
				;;

			'%'*) # tag is viewed on other, focused monitor
				wm_infos+="%{A:herbstclient use_index $(($index-1)):}%{F#b0b0ff} ${i:1:1} %{F-}%{A}"
				;;

			*)
				;;

			esac
			wm_infos=${wm_infos}
		# fi
		shift
        done
		if [[ "$(herbstclient floating status)" == "off" ]]; then
			float="○"
		else
			float="◉"
		fi
        ;;


    REFRESH_PANEL*BIG*)
		usagecpu="$((100-$(vmstat 1 2|tail -1|awk '{print $15}')))"
		usageram="$(free -m | awk 'NR==2{printf "%sMB\n", $3,$2,$3*100/2 }')"
		d_="$(date "+%a, %b %d")"
        ;;


    REFRESH_PANEL*SMALL*)
		volume="$(pamixer --get-volume-human)"
        t_="$(date +%I:%M)"
        ;;
    esac

	echo "%{F#f8f8f8}%{B#0e0e0e} %{l}%{A:rofi -show drun:}  %{A} \
	$wm_infos	\
	%{A:herbstclient floating toggle && herbstclient emit_hook tag_changed:} $float %{A} \
	%{c} %{T+}$wnd_title %{T-}  \
	%{r} RAM: $usageram | \
	CPU: $usagecpu % | $t_ on $d_ |\
	%{A4:pamixer -i 5 && herbstclient emit_hook REFRESH_PANEL SMALL:}%{A5:pamixer -d 5 && herbstclient emit_hook REFRESH_PANEL SMALL:}\
	  $volume %{A}%{A}%{F-}%{B-}"

done | lemonbar -a 14 -g 2560x28 -B "#0e0e0e" -f "Julia Mono:size=10" -f "Font Awesome:size=12" 2> /dev/null | sh &

herbstclient emit_hook tag_changed

# Emit hooks to keep it updating
while true; do
    herbstclient emit_hook REFRESH_PANEL BIG
    for i in {1..10}; do
		herbstclient emit_hook REFRESH_PANEL SMALL
		sleep 2
    done
done &
