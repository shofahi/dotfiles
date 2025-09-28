#!/bin/bash

# Waybar executable name for pgrep
WAYBAR_EXE="waybar"

if pgrep -x "$WAYBAR_EXE" > /dev/null; then
	#Waybar is running. Kill the instance 
	killall waybar
# Check the current WM
else
	if [ "$XDG_CURRENT_DESKTOP" = "sway" ]; then
		waybar -c ~/dotfiles/waybar/.config/waybar/config.sway
	elif [ "$XDG_CURRENT_DESKTOP" = "Hyprland" ]; then
		waybar -c ~/dotfiles/waybar/.config/waybar/config.hyprland
	else
		echo "ERROR: Windows manager is not supported"
		exit 1
	fi
fi
	
