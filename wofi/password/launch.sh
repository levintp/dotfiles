#!/bin/bash



#
# Wofi Powermenu Launcher
#



DEFAULT_PROMPT="Enter sudo password"


prompt="$1"
[ -z "$prompt" ] && prompt="$DEFAULT_PROMPT"

password="$(echo "" | wofi --conf ~/.config/wofi/password/config --style ~/.config/wofi/password/style.css --prompt "$prompt")"
echo $password
