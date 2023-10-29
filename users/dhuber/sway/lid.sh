#!/usr/bin/bash
if grep -q open /proc/acpi/button/lid/LID/state; then
    swaymsg output eDP1 enable
else
    swaymsg output eDP1 disable
fi
