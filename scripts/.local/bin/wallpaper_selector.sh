#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers/"
SCRIPT="$HOME/.local/bin/wallpaper_shuffle.sh"

if [ ! -d "$WALLPAPER_DIR" ]; then
    notify-send "Error" "Wallpaper directory not found!"
    exit 1
fi

tmpfile=$(mktemp)
trap 'rm -f "$tmpfile"' EXIT
declare -A _WALLPAPER_MAP
while IFS= read -r -d '' img; do
    name="$(basename "$img")"
    _WALLPAPER_MAP["$name"]="$img"
    printf "%s\0icon\x1f%s\n" "$name" "$img" >> "$tmpfile"
done < <(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" \) -print0)

choice=$(rofi -dmenu -i -p "Wallpaper" -show-icons -theme ~/.config/rofi/wallpaper.rasi < "$tmpfile")

if [ -n "$choice" ]; then
    choice="${_WALLPAPER_MAP[$choice]}"
fi

if [ -z "$choice" ]; then
    exit 0
fi

"$SCRIPT" "$choice"
