#!/bin/bash



#
# Run commands with sudo through the graphical user interface"
#



sudo_password="$(~/.config/wofi/password/launch.sh)"
[ -z "$sudo_password" ] && exit 1
printf "%s" $sudo_password | sudo -S $@
