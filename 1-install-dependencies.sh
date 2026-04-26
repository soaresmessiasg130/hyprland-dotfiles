#!/bin/bash

packages=(
  cmake
  meson
  scdoc
  libcava
  wayland-protocols
  gst-libav 
  gst-plugins-base 
  gst-plugins-good 
  gst-plugins-bad 
  gst-plugins-ugly 
  gstreamer-vaapi 
  x265 
  x264 
  lame
  gtkmm3
  jsoncpp
  libsigc++
  fmt
  wayland
  chrono-date
  libgtk-3-dev
  libgirepository1.0-dev
  libpulse
  libnl
  libappindicator-gtk3
  libdbusmenu-gtk3
  libsndio
  xkbregistry
  upower

  noto-fonts
  noto-fonts-cjk
  noto-fonts-emoji
  noto-fonts-extra
  ttf-font-awesome
  ttf-jetbrains-mono
  ttf-fira-code
  ttf-ms-fonts
  otf-font-awesome

  polkit-kde-agent 
  qt5-wayland 
  qt6-wayland 
  glib2-devel 
  pavucontrol 
  wl-clipboard 
  cliphist 
  grim 
  slurp 
  nautilus 
  bibata-cursor-theme 
  papirus-icon-theme 
  pfetch 
  nano-syntax-highlighting 
  zsh
  google-chrome

  cava 
  swaync 
  hyprpaper 
  waypaper
  wleave-git 
  hypridle 
  hyprlock 
  hyprpicker 

  bluez
  bluez-utils
  blueman
  libnotify
  brightnessctl
)

# Get the directory where the script is located
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

install_base() {
  echo ""
  echo ""
  echo ""
  echo ">>> INSTALLING BASE-DEVEL AND GIT..."
  echo ""
  sudo pacman -S --noconfirm --needed git base-devel
}

install_aur_helper() {
  if ! command -v yay &> /dev/null && ! command -v paru &> /dev/null; then
    echo ""
    echo ""
    echo ""
    echo ">>> DOWNLOADING YAY..."
    echo ""
    mkdir -p "$SCRIPT_DIR/temp"
    git clone https://aur.archlinux.org/yay.git "$SCRIPT_DIR/temp/yay"
    cd "$SCRIPT_DIR/temp/yay"
    makepkg -si --noconfirm
    cd "$SCRIPT_DIR"
  fi
}

install_packages() {
  echo ""
  echo ""
  echo ""
  echo ">>> INSTALLING PACKAGES AND DEPENDENCIES..."
  echo ""
  
  # Determine which AUR helper to use
  if command -v paru &> /dev/null; then
    HELPER="paru"
  else
    HELPER="yay"
  fi

  for package in "${packages[@]}"; do
    $HELPER -S --noconfirm --needed "$package"
  done
}

install_zsh_ohmyzsh_p10k() {
  echo ""
  echo ""
  echo ""
  echo ">>> INSTALLING ZSH + OH MY ZSH + POWERLEVEL10K..."
  echo ""
  if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  fi
  
  ZSH_CUSTOM_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
  
  if [ ! -d "$ZSH_CUSTOM_DIR/themes/powerlevel10k" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM_DIR/themes/powerlevel10k"
  fi
  
  if [ ! -d "$ZSH_CUSTOM_DIR/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM_DIR/plugins/zsh-autosuggestions"
  fi
  
  if [ ! -d "$ZSH_CUSTOM_DIR/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM_DIR/plugins/zsh-syntax-highlighting"
  fi
  
  sudo chsh -s $(which zsh) $(whoami)
}

gtk_configuration() {
  echo ""
  echo ""
  echo ""
  echo ">>> APPLYING GTK DARK THEME"
  echo ""
  gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
}

clean_temp() {
  echo ""
  echo ""
  echo ""
  echo ">>> CLEANING..."
  echo ""
  rm -rf "$SCRIPT_DIR/temp"
}

echo ">>> STARTED <<<"

install_base
install_aur_helper
install_packages
install_zsh_ohmyzsh_p10k
gtk_configuration
clean_temp

echo ">>> FINISHED <<<"
