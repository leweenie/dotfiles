#!/usr/bin/env bash

input="$(rofi -dmenu -l 0 -p '' -theme-str 'window {width: 25%; border: 1; padding: 0;} listview {lines: 1;} entry {placeholder: "search...";}')"

[ -z "$input" ] && exit 0

input="$(echo "$input" | xargs)"

[ -z "$input" ] && exit 0

if [[ "$input" =~ ^https?:// ]]; then
  chromium "$input"
elif [[ "$input" == *.* ]]; then
  chromium "https://$input"
else
  chromium "https://www.google.com/search?q=${input// /+}" >/dev/null 2>&1 &
fi
