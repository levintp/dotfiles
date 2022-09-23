#!/bin/bash


#
# Lock screen script
#


LOCK_IMAGE='~/.config/sway/pictures/singularity.png'

swaylock --daemonize --ignore-empty-password --image $LOCK_IMAGE
