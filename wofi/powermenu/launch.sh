#!/bin/bash



#
# Wofi Powermenu Launcher
#



POWEROFF=""
REBOOT=""
LOCK=""
ACTION_LIST="$POWEROFF\n$REBOOT\n$LOCK"



action="$(echo -e "$ACTION_LIST"| wofi --dmenu --conf ~/.config/wofi/powermenu/config --style ~/.config/wofi/powermenu/style.css)"

[ -z "$action" ] && exit 1

case $action in
        $POWEROFF)
		~/.config/scripts/graphical_sudo.sh shutdown --poweroff now
		;;
        $REBOOT)
		~/.config/scripts/graphical_sudo.sh shutdown --reboot now
		;;
        $LOCK)
		~/.config/sway/scripts/lock.sh
                ;;
esac
