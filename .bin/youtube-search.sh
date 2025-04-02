#!/bin/bash

search=$(wofi --show dmenu --height 2) || exit
search="${search// /+}"

prefix="https://www.youtube.com/results?search_query="

url="$prefix$search"

xdg-open $url
