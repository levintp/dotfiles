#!/bin/bash



#
# Waybar module script to turn up the backlight of the system.
#

# Read `man brightnessctl` for more information.



STEP=5



brightnessctl s ${STEP}%+ > /dev/null
