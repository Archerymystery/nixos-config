#!/usr/bin/env bash
selection=$(cliphist list | wofi --dmenu)

if [ -z "$selection" ]; then
    exit 0
fi
echo "$selection" | cliphist decode | wl-copy
