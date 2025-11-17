#!/usr/bin/env bash

walldir="$HOME/downloads/images"

selected=$(ls "$walldir" | rofi -dmenu -p "" -i)

if [ -n "$selected" ]; then
    echo "setting: $selected"
    swww img "$walldir/$selected"
else
    echo "no wallpaper selected."
fi
