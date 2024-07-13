#!/bin/bash

user_confirmation() {
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

declare -A source_target_paths=(
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

backup_dir="$HOME/.config-backups"

echo ">>> started"

if user_confirmation "Do you want to backup your config before proceeding?"; then
  mkdir -p "$backup_dir"
  for target in "${!source_target_paths[@]}"; do
    if [ -e "$target" ]; then
      cp -r "$target" "$backup_dir/"
    fi
  done
  echo ">>> backups on $backup_dir"
fi

for target in "${!source_target_paths[@]}"; do
  source="${source_target_paths[$target]}"
  rm -rf "$target"
  ln -s "$source" "$target"
  echo ">>> linked $source -> $target"
done

echo ">>> finished"
