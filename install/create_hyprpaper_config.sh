#!/bin/bash

WALLPAPER_PATH="$HOME/dotfiles/hyprpaper/wallpapers/wallpaper1.jpg"
CONFIG_FILE="$HOME/dotfiles/hyprpaper/config.conf"

echo "  Generating hyprpaper config for wallpaper: $WALLPAPER_PATH"
echo "  Outputting to: $CONFIG_FILE"

MONITORS=$(hyprctl monitors | grep -oP 'Monitor \K[^ ]+' | awk '{print}')

CONFIG_CONTENT="preload = $WALLPAPER_PATH
splash = false
"

for MONITOR in $MONITORS; do
    CONFIG_CONTENT+="wallpaper = $MONITOR,$WALLPAPER_PATH
"
done

echo -e "$CONFIG_CONTENT" > "$CONFIG_FILE"
echo "  Done!"