 #!/bin/bash

query=$(rofi -dmenu -l 5 -p "music: ")

[ "$query" = "" ] && exit 1

mapfile -t tracks < <(spotify_player search "$query" | jq -r '.tracks[] | "\(.name) - \(.artists[0].name)::\(.id)"' | head -n 10)

choices=()
for track in "${tracks[@]}"; do
    choices+=("${track%%::*}")
done

selection=$(spt; printf '%s\n' "${choices[@]}" | rofi -dmenu -p "music: ")

[ "$selection" = "" ] && exit 1

for track in "${tracks[@]}"; do
    name="${track%%::*}"
    id="${track##*::}"
    if [[ "$name" == "$selection" ]]; then
        spotify_player playback start track --id "$id"
        break
    fi
done
