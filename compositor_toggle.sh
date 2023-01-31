#!/bin/bash
#FILE LOCATION: ~/.config/polybar/compositor_toggle.sh
killall -9 picom
picom --experimental-backend &
