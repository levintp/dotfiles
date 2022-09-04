#!/bin/bash



#
# Waybar module script to display the volume of the system.
#

# Read `man pwctl` for more information.



audio_data="$(wpctl get-volume @DEFAULT_AUDIO_SINK@)"

if echo $audio_data | grep MUTED > /dev/null; then
    echo '{"alt":"mute", "tooltip":"muted"}'
else
    percentage=$(echo "$(echo $audio_data | cut -d' ' -f 2) * 100" | bc | cut -d'.' -f 1)
    echo '{"percentage":'$percentage', "tooltip":"'$percentage'%", "alt":"'$percentage'%"}'
fi
