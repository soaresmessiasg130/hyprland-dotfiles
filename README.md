# hyprland-dotfiles

cd https://github.com/hyprland-community/awesome-hyprland
https://github.com/ErikReider/SwayNotificationCenter
https://github.com/JaKooLit/Wallpaper-Bank.git

```bash
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

```bash
yay -S gst-libav gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly gstreamer-vaapi x265 x264 lame
yay -S adobe-source-sans-pro-fonts ttf-dejavu ttf-opensans noto-fonts freetype2 terminus-font ttf-bitstream-vera ttf-dejavu ttf-droid ttf-fira-mono ttf-fira-sans ttf-freefont ttf-inconsolata ttf-liberation libertinus-font
# or yay -S all-repository-fonts
yay -S ttf-ms-win11-auto
yay -S otf-san-francisco otf-san-francisco-mono
```

``` bash
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
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

rm -rf $HOME/.config/hypr
rm -rf $HOME/.config/gBar
rm -rf $HOME/.local/share/fonts
rm -rf $HOME/.config/kitty
rm -rf $HOME/.config/waybar
rm -rf $HOME/.config/wofi
rm -rf $HOME/.config/gtk-3.0
rm -rf $HOME/.config/wleave
rm -rf $HOME/.zshrc
rm -rf $HOME/.p10k.zsh

ln -s $HOME/hyprland-dotfiles/hypr $HOME/.config/hypr
ln -s $HOME/hyprland-dotfiles/gBar $HOME/.config/gBar
ln -s $HOME/hyprland-dotfiles/fonts $HOME/.local/share/fonts
ln -s $HOME/hyprland-dotfiles/kitty $HOME/.config/kitty
ln -s $HOME/hyprland-dotfiles/waybar $HOME/.config/waybar
ln -s $HOME/hyprland-dotfiles/wofi $HOME/.config/wofi
ln -s $HOME/hyprland-dotfiles/gtk-3.0 $HOME/.config/gtk-3.0
ln -s $HOME/hyprland-dotfiles/wleave $HOME/.config/wleave
ln -s $HOME/hyprland-dotfiles/zsh/.zshrc $HOME/.zshrc
ln -s $HOME/hyprland-dotfiles/zsh/.p10k.zsh $HOME/.p10k.zsh

mkdir pictures folder
```
