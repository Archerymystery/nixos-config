#!/bin/bash

entries="󰍹 Capture screen\n󰩬 Capture area\n  Capture active window\n󱑀  Take in 5s\n󱑇  Take in 10s\n Capture text from screen"
entriesLang="Ukrainian\nEnglish"
selected=$(echo -e "$entries"|wofi --width 350 --height 240 --dmenu --cache-file /dev/null --location 0 )
case $selected in
  "󰍹 Capture screen")
    exec grimblast copysave screen;;
  "󰩬 Capture area")
    exec grimblast copysave area;;
  " Capture active window")
    exec grimblast copysave active;;
  "󱑀 Take in 5s")
    sleep 5
    exec grimblast copysave screen;;
  "󱑇 Take in 10s")
    sleep 10
    exec grimblast copysave screen;;
  " Capture text from screen")
    selected=$(echo -e $entriesLang|wofi --width 350 --height 240 --dmenu --cache-file /dev/null --location 0 )
    case $selected in
      "Ukrainian")
        exec grimblast copysave area | tesseract - - -l ukr | wl-copy;;
      "English")
        exec grimblast copysave area | tesseract - - -l eng | wl-copy
    esac;;
esac
