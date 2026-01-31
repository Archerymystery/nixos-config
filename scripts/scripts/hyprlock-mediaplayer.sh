#!/usr/bin/env bash
get_metadata(){
  echo $( playerctl metadata | grep "$1" | sed -E 's/^([^ ]+[ ]+){2}//');
 
 
}
get_progress() {
  local all_t=$(awk -v all_t="$(get_metadata length)" 'BEGIN {print all_t/1000000}' )
  local cur_t=$(playerctl position)
  
  local progress=$(printf '%.0f' "$(awk -v all_t=$all_t -v cur_t=$cur_t 'BEGIN {print (cur_t/all_t)*27}' )")
  
  
  printf '%d:%02d ' $((${cur_t%.*} / 60)) $((${cur_t%.*} % 60)) 
  for ((i=0; i<progress; i++)); do printf "─"; done
  printf "<span color='#797a7a'>"
  for ((i=0; i<(27-progress); i++)); do printf "─"; done
  printf "</span>"
  printf ' %d:%02d\n' $((all_t / 60)) $((all_t % 60)) 
}
playerUrl=$( playerctl metadata | grep "url" |  sed 's/.* //' )

if [[ "$playerUrl" == https://www.youtube.com* ]] || [[ $(playerctl status 2>&1) == "No players found" ]]; then
  playerctl stop; 
  case $1 in
    "--none")
      echo "Nothing is playing"
    ;;
    *)
      echo ""
    ;;
  esac
  exit;
fi

case $1 in
  "--progress")
    get_progress;
  ;;
  "--title")

    title=$(get_metadata "title");
    if [ ${#title} -gt 27 ]; then
      echo "${title:0:27}..."
    else
      echo "$title"
    fi
  ;;
  "--artist")
    echo "󰠃 $(get_metadata "artist")"
  ;;
  "--album")
   get_metadata "album"
  ;;
  "--cover")
    get_metadata "file"| sed -E "s/file:\/\///";
  ;;
   "--status")
   case  "$(playerctl status)" in
   "Playing")
      echo " "
    ;;
    *)
      echo " "
    ;;
    esac
  ;;
  "--switch")
    playerctl play-pause  
  ;;
  "--next")
    playerctl next    
  ;;
  "--previous")
    playerctl previous
  ;;
  "--icon")
    echo "$2"
  ;;
  *)
    echo ""
  ;;
esac

