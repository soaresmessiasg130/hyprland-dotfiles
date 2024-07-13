#!/bin/bash

# Function to confirm reboot
confirm_reboot() {
    read -r -p "Are you sure you want to reboot the system? [y/N] " response
    case "$response" in
        [yY][eE][sS]|[yY])
            sudo reboot
            ;;
        *)
            echo "Reboot cancelled."
            ;;
    esac
}

# Main script execution
echo "This script will reboot the system."
confirm_reboot
