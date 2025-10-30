#!/usr/bin/env bash

volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | tr -d '%')
is_muted=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

bar_length=20
filled_length=$(( (bar_length * volume) / 100 ))
empty_length=$(( bar_length - filled_length ))

for ((i=0; i<filled_length; i++)); do
    bar+="■"
done
for ((i=0; i<empty_length; i++)); do
    bar+="□"
done

if [ "$is_muted" = "yes" ]; then
    msg="Muted"
else
    msg="$bar $volume%"
fi


dunstify -h string:x-dunst-stack-tag:volume \
         -t 2000 \
         "Volume" \
         "$msg"
