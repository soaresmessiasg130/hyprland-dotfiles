# hyprland-dotfiles
Arch Linux + Hyprland

## Before install
    
I recomended to install Hyprland with:
- Pipewire: as a server audio;
- GDM: as a display manager; -- this will install GNOME Desktop too, but GDM its pretty
- Kernel linux or linux-lts;
- Enable ```multilib``` aditional repository;

## Installation

- Install dependencies and packages and everything:

```sh
./1-install-dependencies.sh
```

- Backup(or not) you config, REMOVE old configs and link:

```sh
./2-setup-links.sh
```

- Reboot your system:

```sh
./3-reboot-system.sh
```

## After install

### Monitors

- I set default of 10 workspaces to monitor 0;
- Make your own configuration;
- My configuration is commented;
- See MONITORS on /hypr/hyprland.conf;

### Waybar

- Waybar(top bar) is enabled for all monitors;
- Left of Waybar showing:
  - App drawing;
  - Logos:
    - Arch Linux;
    - Hyprland;
    - Username and logo:
      - change your user logo saving your in /assets as user.png then reboot your system;
- Center of Waybar showing system status:
  - CPU %;
  - MEMORY %;
  - CPU TEMPERATURE:
    - probably your CPU TEMP will not appears;
    - because you need to set the CPU TEMP file on /waybar/config.jsonc;
    - my CPU TEMP FILE is: /sys/devices/pci0000:00/0000:00:18.3/hwmon/hwmon1/temp1_input;
    - search for your file path and replace;
    - then run ```killall waybar && waybar &```;
    - finally, reboot your system;
- Right of Waybar showing some widgets:
  - network:
    - to set network interface, uncomment ```"interface"``` on /waybar/config.jsonc;
  - bluetooth:
    - uses blueman-manager;
  - battery:
    - if you are using laptop, the default battery is ```BAT0```;

