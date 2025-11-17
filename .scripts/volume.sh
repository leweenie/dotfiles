#!/usr/bin/env bash

volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | tr -d '%')
is_muted=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

bar_length=20
filled_symbol="━"
empty_symbol="─"

filled_length=$(((bar_length * volume) / 100))
empty_length=$((bar_length - filled_length))

bar=""
for ((i = 0; i < filled_length; i++)); do
    bar+="$filled_symbol"
done
for ((i = 0; i < empty_length; i++)); do
    bar+="$empty_symbol"
done

formatted_vol=$(printf "%3d%%" "$volume")

if [ "$is_muted" = "yes" ]; then
    msg="muted"
else
    msg="[$bar]  $formatted_vol"
fi

msg=$(printf "%-70s" "$msg")

dunstify -h string:x-dunst-stack-tag:volume \
    -t 1500 \
    "volume" \
    "$msg"
