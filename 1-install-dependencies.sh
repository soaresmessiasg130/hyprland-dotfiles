#!/bin/bash

packages=(
  gst-libav 
  gst-plugins-base 
  gst-plugins-good 
  gst-plugins-bad 
  gst-plugins-ugly 
  gstreamer-vaapi 
  x265 
  x264 
  lame 

  noto-fonts
  noto-fonts-cjk
  noto-fonts-emoji
  noto-fonts-extra

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
  gbar-git 
  hyprpaper 
  waypaper-engine 
  waybar 
  wleave-git 
  hypridle 
  hyprlock 
  hyprpicker 

  piper 
  vivaldi 
)

install_yay() {
  if ! command -v yay &> /dev/null; then
    echo "installing yay..."
    sudo pacman -S --noconfirm --needed git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
  else
    echo "yay is already installed..."
  fi
}

install_packages() {
  echo "installing packages..."
  for package in "${packages[@]}"; do
    echo "Installing $package"
    yay -S --noconfirm --needed "$package"
  done
}

install_zsh_ohmyzsh_p10k() {
  echo "installing Zsh + Oh My Zsh + Powerlevel10k..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
}

echo ">>> started"

cd $HOME

install_yay

install_packages

install_zsh_ohmyzsh_p10k

echo ">>> finished"
