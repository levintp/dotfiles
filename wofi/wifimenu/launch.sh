#!/bin/bash



#
# Wofi Wifimenu Launcher
#



STATION="wlan0"
NETWORKS=""
EXTRA_FLAGS=""

for network in "$(nmcli --get-values SSID,RATE,SIGNAL,SECURITY --colors no dev wifi list)"; do
	ssid=$(echo $network | cut -d':' -f1)
	rate=$(echo $network | cut -d':' -f2)
	signal=$(echo $network | cut -d':' -f3)
	security=$(echo $network | cut -d':' -f4)

	[ -z "$security" ] && security="Open"
	network_desc="${signal}% - $ssid ($security)"

	[ -z "$NETWORKS" ] || NETWORKS+="\n"
	NETWORKS="$network_desc"
done

network_desc="$(echo -e "$NETWORKS"| wofi --dmenu --conf ~/.config/wofi/wifimenu/config --style ~/.config/wofi/wifimenu/style.css)"
[ -z "$network_desc" ] && exit 1

ssid="$(echo $network_desc | cut -d'-' -f 2 | cut -d'(' -f 1 | xargs)"

sudo_password="$(~/.config/wofi/password/launch.sh)"

known_matches=0
OLDIFS=$IFS
IFS=$'\n'
for known_net in $(printf "%s" $sudo_password | sudo -S iwctl known-networks list | tail -n +5 | head -n -1 | cut -d' ' -f 3- | cut -c -34); do
	known_net="$(echo "$known_net" | xargs)"
	if [ "$ssid" == "$known_net" ]; then
		known_matches+=1
	fi
done
IFS=$OLDIFS

if [ "$known_matches" == "0" ] && [ "$security" != "Open" ]; then
	wifi_password="$(~/.config/wofi/password/launch.sh "Enter the password for $ssid")"
	[ -z "$wifi_password" ] && exit 1
	EXTRA_FLAGS+="--passphrase $wifi_password"
fi

printf "%s" $sudo_password | sudo -S iwctl station "$STATION" connect "$ssid" $EXTRA_FLAGS
