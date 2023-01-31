#!/bin/bash
#FILE LOCATION: ~/.config/awesome/polybar_start.sh
killall -9 polybar
polybar left &
polybar right &
