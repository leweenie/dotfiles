#!/usr/bin/env bash

brightness=$(brightnessctl get)
max_brightness=$(brightnessctl max)
percent=$((100 * brightness / max_brightness))

bar_length=20
filled_symbol="━"
empty_symbol="─"

filled_length=$(((bar_length * percent) / 100))
empty_length=$((bar_length - filled_length))

bar=""
for ((i = 0; i < filled_length; i++)); do
    bar+="$filled_symbol"
done
for ((i = 0; i < empty_length; i++)); do
    bar+="$empty_symbol"
done

formatted_pct=$(printf "%3d%%" "$percent")

msg="[$bar]  $formatted_pct"
msg=$(printf "%-70s" "$msg")

dunstify -h string:x-dunst-stack-tag:brightness \
    -t 1500 \
    "brightness" \
    "$msg"
