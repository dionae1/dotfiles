#!/bin/bash
WALLPAPER_DIR="$HOME/Pictures/Wallpapers/"

if [ -n "$1" ]; then
    IMG="$1"
else
    IMG=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" \) | shuf -n 1)
fi

if [ -z "$IMG" ]; then
    notify-send "Error" "Image not found!"
    exit 1
fi

wal -i "$IMG" -n -q -t > /dev/null 2>&1
kitty @ set-colors -a -c "$HOME/.cache/wal/colors-kitty.conf"
plasma-apply-wallpaperimage "$IMG"
kwriteconfig6 --file kscreenlockerrc --group Greeter --group Wallpaper --group org.kde.image --group General --key Image "file://$IMG"
notify-send "Visual Updated" "Wallpaper applied: ${IMG##*/}"
