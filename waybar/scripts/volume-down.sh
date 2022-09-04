#!/bin/bash



#
# Waybar module script to turn up the volume of the system.
#

# Read `man pwctl` for more information.



STEP=5
MIN_VOLUME=0
CURRENT_VOLUME=$(echo "$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -d' ' -f 2) * 100" | bc | cut -d'.' -f 1)

if [ "$CURRENT_VOLUME" -gt "$MIN_VOLUME" ]; then
    wpctl set-volume @DEFAULT_AUDIO_SINK@ ${STEP}%-
fi
