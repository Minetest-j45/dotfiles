#!/bin/bash
#FILE LOCATION: ~/.config/polybar/compositor_toggle.sh
if (($(ps -aux | grep [p]icom | wc -l) > 0))
then
  killall -9 picom
else
  picom --experimental-backend &
fi
