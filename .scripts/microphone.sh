#!/usr/bin/env bash

is_muted=$(pactl get-source-mute @DEFAULT_SOURCE@ | awk '{print $2}')

if [ "$is_muted" = "yes" ]; then
    msg="Microphone Muted"
else
    msg="Microphone Active"
fi

dunstify -h string:x-dunst-stack-tag:microphone \
         -t 2000 \
         "Microphone" \
         "$msg"
