#!/bin/bash

# Function to install yay
install_yay() {
    echo "Installing yay..."
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    rm -rf yay
    echo "yay installed successfully."
}

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
  all-repository-fonts 
  ttf-ms-win11-auto 
  otf-san-francisco 
  otf-san-francisco-mono 
  polkit-kde-agent 
  qt5-wayland 
  qt6-wayland 
  swaync 
  glib2-devel 
  gbar-git 
  bibata-cursor-theme 
  hyprpaper 
  waypaper-engine 
  piper 
  grim 
  slurp 
  wl-clipboard 
  nautilus 
  vivaldi 
  papirus-icon-theme 
  pavucontrol 
  waybar 
  wleave-git 
  cava 
  hypridle 
  hyprlock 
  hyprpicker 
  cliphist 
  pfetch 
  nano-syntax-highlighting 
  zsh
)

# Function to install packages
install_packages() {
    for package in "${packages[@]}"; do
      yay -S --noconfirm --needed "$package"
    done
}

# Function to install Oh My Zsh and plugins
install_oh_my_zsh() {
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    
    echo "Installing Powerlevel10k theme..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    
    echo "Installing Zsh plugins..."
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    
    echo "Oh My Zsh and plugins installed successfully."
}

# Main script execution
echo "Starting installation process..."

# Install yay
if ! command -v yay &> /dev/null; then
    install_yay
else
    echo "yay is already installed."
fi

# Install packages
echo "Installing packages..."

install_packages

echo "Packages installed successfully."

# Install Oh My Zsh and plugins
install_oh_my_zsh

echo "Installation process completed."
