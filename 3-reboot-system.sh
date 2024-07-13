#!/bin/bash

# Function to confirm reboot
confirm_reboot() {
  read -r -p ">>> reboot now??? [y/N] " response
  case "$response" in
    [yY][eE][sS]|[yY])
      sudo reboot
      ;;
    *)
      echo ">>> reboot cancelled!!!"
      ;;
  esac
}

# Main script execution
echo ">>> this will reboot the system!!!"

confirm_reboot
