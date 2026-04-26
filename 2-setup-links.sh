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

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

declare -A source_target_paths=(
  ["$HOME/.config/hypr"]="$SCRIPT_DIR/hypr"
  ["$HOME/.local/share/fonts"]="$SCRIPT_DIR/fonts"
  ["$HOME/.config/kitty"]="$SCRIPT_DIR/kitty"
  ["$HOME/.config/waybar"]="$SCRIPT_DIR/waybar"
  ["$HOME/.config/wofi"]="$SCRIPT_DIR/wofi"
  ["$HOME/.config/gtk-3.0"]="$SCRIPT_DIR/gtk-3.0"
  ["$HOME/.config/gtk-4.0"]="$SCRIPT_DIR/gtk-4.0"
  ["$HOME/.config/qt5ct"]="$SCRIPT_DIR/qt5ct"
  ["$HOME/.config/wleave"]="$SCRIPT_DIR/wleave"
  ["$HOME/.zshrc"]="$SCRIPT_DIR/zsh/.zshrc"
  ["$HOME/.p10k.zsh"]="$SCRIPT_DIR/zsh/.p10k.zsh"
)

backup_dir="$HOME/.config-backups"

echo ">>> started"

if user_confirmation "Do you want to backup your config before proceeding?"; then
  mkdir -p "$backup_dir"
  for target in "${!source_target_paths[@]}"; do
    if [ -e "$target" ]; then
      cp -rL "$target" "$backup_dir/$(basename "$target")-$(date +%Y%m%d%H%M%S)"
    fi
  done
  echo ">>> backups on $backup_dir"
fi

for target in "${!source_target_paths[@]}"; do
  source="${source_target_paths[$target]}"
  
  # Only remove if it exists
  if [ -e "$target" ] || [ -L "$target" ]; then
    rm -rf "$target"
  fi
  
  # Create parent directory if it doesn't exist
  mkdir -p "$(dirname "$target")"
  
  ln -s "$source" "$target"
  echo ">>> linked $source -> $target"
done

# Optionally link .zshrc.local if it exists in the repo
if [ -f "$SCRIPT_DIR/zsh/.zshrc.local" ]; then
  rm -rf "$HOME/.zshrc.local"
  ln -s "$SCRIPT_DIR/zsh/.zshrc.local" "$HOME/.zshrc.local"
  echo ">>> linked $SCRIPT_DIR/zsh/.zshrc.local -> $HOME/.zshrc.local"
fi

echo ">>> finished"
