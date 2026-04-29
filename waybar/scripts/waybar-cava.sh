#!/bin/bash

# Path to the specialized cava config
CONFIG_FILE="$HOME/.config/waybar/cava.conf"

# Ensure the config exists (it should, as I just created it in the dotfiles)
# But since waybar uses the symlinked path, I'll use that.

cava -p "$CONFIG_FILE" | sed -u 's/;//g' | while read -r line; do
    echo "$line" | awk '{
        split("  ▂▃▄▅▆▇█", chars, "");
        for (i=1; i<=NF; i++) printf "%s", chars[$i+1];
        print "";
    }'
done
