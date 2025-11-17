#!/usr/bin/env bash

paths=("$HOME/downloads/books" "$HOME/Downloads" "$HOME/school")
selected=$(find "${paths[@]}" -type f -name "*.pdf" -printf "%f\n" | sort -u | rofi -dmenu -p "" -i)

[ -n "$selected" ] && zathura "$(find "${paths[@]}" -type f -name "$selected" -print -quit)"
