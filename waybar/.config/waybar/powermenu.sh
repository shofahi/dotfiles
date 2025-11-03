#!/bin/bash

# Define the options for the launcher (e.g., wofi)
options="Sleep\nSuspend\nReboot\nShutdown"

# Get the choice using wofi (or dmenu)
choice=$(echo -e $options | wofi --dmenu --prompt="Power Options" -i)

# Execute the corresponding action
case "$choice" in
    Sleep)
        systemctl suspend ;;
    Suspend)
        systemctl suspend ;;
    Reboot)
        systemctl reboot ;;
    Shutdown)
        systemctl poweroff ;;
    *)
        # Do nothing on escape or cancel
        ;;
esac
