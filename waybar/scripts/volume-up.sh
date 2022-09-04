#!/bin/bash



#
# Waybar module script to turn up the volume of the system.
#

# Read `man pwctl` for more information.



STEP=5
MAX_VOLUME=100
CURRENT_VOLUME=$(echo "$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -d' ' -f 2) * 100" | bc | cut -d'.' -f 1)

if [ "$CURRENT_VOLUME" -lt "$MAX_VOLUME" ]; then
    wpctl set-volume @DEFAULT_AUDIO_SINK@ ${STEP}%+
fi
