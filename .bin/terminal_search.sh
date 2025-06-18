#!/bin/bash

if [ $# -gt 0 ]; then
    message="$*"
    
    if [[ "$message" =~ ^https?:// ]] || [[ "$message" =~ ^www\. ]] || [[ "$message" == *.* ]]; then

        if [[ ! "$message" =~ ^https?:// ]]; then
            url="https://$message"
        else
            url="$message"
        fi
        nohup floorp "$url" > /dev/null 2>&1 &

    else
        query="https://www.google.com/search?q=${message// /+}"
        nohup qutebrowser "$query" > /dev/null 2>&1 &
    fi
else
    echo "null message."
fi
