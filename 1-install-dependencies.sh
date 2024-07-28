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

  cava 
  swaync 
  hyprpaper 
  waypaper-engine 
  wleave-git 
  hypridle 
  hyprlock 
  hyprpicker 

  piper 
  vivaldi 
  bluez
  bluez-utils
  blueman
)

install_base() {
  echo ""
  echo ""
  echo ""
  echo ">>> DOWNLOADING YAY AND WAYBAR, AND INSTALL BASE..."
  echo ""
  mkdir -p ./temp
  if ! command -v yay &> /dev/null; then
    git clone https://aur.archlinux.org/yay.git ./temp/yay
  fi
  if ! command -v waybar &> /dev/null; then
    git clone https://github.com/Alexays/Waybar.git ./temp/waybar
  fi
  sudo pacman -S --noconfirm --needed git base-devel
}

install_yay() {
  if ! command -v yay &> /dev/null; then
    echo ""
    echo ""
    echo ""
    echo ">>> INSTALLING YAY..."
    echo ""
    cd ./temp/yay
    makepkg -si --noconfirm
    cd ../..
  fi
}

install_packages() {
  echo ""
  echo ""
  echo ""
  echo ">>> INSTALLING PACKAGES AND DEPENDENCIES..."
  echo ""
  for package in "${packages[@]}"; do
    yay -S --noconfirm --needed "$package"
  done
}

install_waybar() {
  if ! command -v waybar &> /dev/null; then
    echo ""
    echo ""
    echo ""
    echo ">>> INSTALLING WAYBAR..."
    echo ""
    cd ./temp/waybar
    make
    sudo meson install -C build
    cd ../..
  fi
}

install_zsh_ohmyzsh_p10k() {
  echo ""
  echo ""
  echo ""
  echo ">>> INSTALLING ZSH + OH MY ZSH + POWERLEVEL10K..."
  echo ""
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  chsh -s $(which zsh)
}

clean_temp() {
  echo ""
  echo ""
  echo ""
  echo ">>> CLEANING..."
  echo ""
  rm -rf ~/hyprland-dotfiles/temp
}

echo ">>> STARTED <<<"

install_base

install_yay

install_packages

install_waybar

install_zsh_ohmyzsh_p10k

clean_temp

echo ">>> FINISHED <<<"
