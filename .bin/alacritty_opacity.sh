#!/bin/bash

CURRENT_SELECTED=$(sed -n '9p' $HOME/.config/alacritty/alacritty.toml)

if [ "$CURRENT_SELECTED" == "opacity = 1" ]; then
  sed -i '9c opacity = 0.9' $HOME/.config/alacritty/alacritty.toml

elif [ "$CURRENT_SELECTED" == "opacity = 0.9" ]; then
  sed -i '9c opacity = 1' $HOME/.config/alacritty/alacritty.toml

fi
