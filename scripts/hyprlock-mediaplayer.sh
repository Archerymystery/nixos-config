#!/bin/bash
get_metadata(){
  echo $( playerctl metadata | grep "$1" | sed -E 's/^([^ ]+[ ]+){2}//');
 
 
}
get_progress() {
  local progress=$(awk -v all_t="$(get_metadata length)" -v cur_t="$(playerctl position)" 'BEGIN {print cur_t/(all_t/100000000)}' )
  echo $progress
}
playerUrl=$( playerctl metadata | grep "url" |  sed 's/.* //' )
if [[ "$playerUrl" == https://www.youtube.com* ]]; then
  echo " 255, 255, 255, 0 ";
  exit;
fi

case $1 in
  "--progress")
    get_progress;
  ;;
  "--title")
    get_metadata "title"
  ;;
  "--artist")
    get_metadata "artist"
  ;;
  "--album")
   get_metadata "album"
  ;;
  "--cover")
    get_metadata "file"| sed -E "s/file:\/\///";
  ;;
  "--color")
    echo "$2"
  ;;
  *)
    echo "else"
  ;;
esac

