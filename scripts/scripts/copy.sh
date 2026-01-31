#!/usr/bin/env bash
selection=$(cliphist list | wofi --dmenu --cache-file /dev/null)

if [ -z "$selection" ]; then
    exit 0
fi
echo "$selection" | cliphist decode | wl-copy
