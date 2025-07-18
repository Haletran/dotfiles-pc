#!/bin/sh

WALLS_PATH="$HOME/Images/walls"
WALL_NAME="$(cat $HOME/Images/walls/current_wall.txt)"

picom --config "$HOME/.config/picom/picom.conf" &
slstatus &
feh --bg-fill "$WALLS_PATH/$WALL_NAME" &
setxkbmap us
dunst &
exec dwm

#while type dwm >/dev/null; do dwm && continue || break; done
