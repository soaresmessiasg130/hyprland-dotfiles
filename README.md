# hyprland-dotfiles

https://wiki.hyprland.org/Useful-Utilities/Must-have
https://github.com/hyprland-community/awesome-hyprland
https://github.com/ErikReider/SwayNotificationCenter
https://github.com/JaKooLit/Wallpaper-Bank.git

```bash
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
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
hypridle
hyprlock
hyprpicker
cliphist
pfetch
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
```
