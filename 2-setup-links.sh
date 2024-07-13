#!/bin/bash

# Function to prompt for user confirmation
confirm() {
    read -r -p "$1 [y/N] " response
    case "$response" in
        [yY][eE][sS]|[yY])
            true
            ;;
        *)
            false
            ;;
    esac
}

# All source and target folders
declare -A paths=(
    ["$HOME/.config/hypr"]="$HOME/hyprland-dotfiles/hypr"
    ["$HOME/.config/gBar"]="$HOME/hyprland-dotfiles/gBar"
    ["$HOME/.local/share/fonts"]="$HOME/hyprland-dotfiles/fonts"
    ["$HOME/.config/kitty"]="$HOME/hyprland-dotfiles/kitty"
    ["$HOME/.config/waybar"]="$HOME/hyprland-dotfiles/waybar"
    ["$HOME/.config/wofi"]="$HOME/hyprland-dotfiles/wofi"
    ["$HOME/.config/gtk-3.0"]="$HOME/hyprland-dotfiles/gtk-3.0"
    ["$HOME/.config/qt5ct"]="$HOME/hyprland-dotfiles/qt5ct"
    ["$HOME/.config/wleave"]="$HOME/hyprland-dotfiles/wleave"
    ["$HOME/.zshrc"]="$HOME/hyprland-dotfiles/zsh/.zshrc"
    ["$HOME/.p10k.zsh"]="$HOME/hyprland-dotfiles/zsh/.p10k.zsh"
)

# Backup directory
backup_dir="$HOME/.config-backups"

# Ask for backup
if confirm "Do you want to backup your config before proceeding?"; then
    mkdir -p "$backup_dir"
    for target in "${!paths[@]}"; do
        if [ -e "$target" ]; then
            cp -r "$target" "$backup_dir/"
            echo "Backed up $target to $backup_dir/"
        fi
    done
    echo "Backup completed."
fi

# Proceed with installation
for target in "${!paths[@]}"; do
    source="${paths[$target]}"
    rm -rf "$target"
    ln -s "$source" "$target"
    echo "Linked $source to $target"
done

echo "All configurations have been linked:"
for target in "${!paths[@]}"; do
    echo "$target -> ${paths[$target]}"
done

echo "Everything is done."
