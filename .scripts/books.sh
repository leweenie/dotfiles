#!/usr/bin/env bash

BOOKS="$HOME/downloads/books"


book_files=($(ls "$BOOKS"))

for i in "${!book_files[@]}"; do
    echo "$((i+1)). ${book_files[$i]}"
done

echo -n "what about book do you want to read (enter index): "
read book_choice

if [[ "$book_choice" -gt 0 && "$book_choice" -le "${#book_files[@]}" ]]; then
    selected_book="${BOOKS}/${book_files[$((book_choice - 1))]}"
    
    echo "you selected: $selected_book"
    exec nohup zathura $selected_book > /dev/null 2>&1
else
    echo "invalid selection."
fi
