# hyprland-dotfiles
Arch Linux + Hyprland

## Before install
    
I recomended to install Hyprland with:
- Pipewire: as a server audio;
- GDM: as a display manager(this will install GNOME Desktop too, but GDM its pretty);
- Kernel linux or linux-lts;
- Enable ```multilib``` aditional repository;

## All you need to know

### Keyborard

- Layout: ```us``` - English(US)
- Variant: ```alt-intl``` - alt. International

## Installation

Download this repository into ```~/hyprland-dotfiles```:

```sh
git clone https://github.com/soaresmessiasg130/hyprland-dotfiles.git ~/hyprland-dotfiles

cd ~/hyprland-dotfiles
```

Install dependencies and packages and everything(AT THE FINAL, some installations NEEDS you CONFIRMATION):

```sh
./1-install-dependencies.sh
```

Backup(or not) you config, REMOVE old configs and link:

```sh
./2-setup-links.sh
```

Reboot your system:

```sh
./3-reboot-system.sh
```

## After install

### Monitors

- Make your own configuration;
- My configuration is commented;
- See MONITORS on /hypr/hyprland.conf;

### Waybar

- Enabled for all monitors;
- Left:
  - Active window;
  - Tools;
  - Workspaces;
  - Logos:
    - Arch Linux, Hyprland and User logos:
      - change your user logo saving your in /assets as user.png then reboot your system;
- Center:
  - System Status;
    - CPU %;
    - MEMORY %;
    - CPU TEMPERATURE:
      - probably your CPU TEMP will not appears;
      - because you need to set the CPU TEMP file on /waybar/config.jsonc;
      - my CPU TEMP FILE is: /sys/devices/pci0000:00/0000:00:18.3/hwmon/hwmon1/temp1_input;
      - search for your file path and replace;
      - then run ```killall waybar && waybar &```;
      - finally, reboot your system;
- Right:
  - System trays;
  - Network:
    - to set network interface, uncomment ```"interface"``` on /waybar/config.jsonc;
  - Bluetooth:
    - uses blueman-manager;
  - Battery:
    - if you are using laptop, the default battery is ```BAT0```;
  - Audio indicators
  - Clock and date;

### Wallpapers

- you need to configure the wallpapers, running `waypaper`;


### Screenshots

[Screenshot 1](./assets/screenshot-1.png)

[Screenshot 2](./assets/screenshot-2.png)
