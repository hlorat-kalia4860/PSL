#!/bin/bash

# Checking the charging connection

if grep "0" /sys/class/power_supply/*/online


then # If charging is disabled


# Editing APM hard drives on 128

if grep "1" /sys/block/sd*/queue/rotational # Checking on hdd
then
sudo hdparm -B 128 -S 0 /dev/sd*
fi


# Enabling the audio card power saving mode

echo 1 > /sys/module/snd_hda_intel/parameters/power_save


# Disabling bluetooth

systemctl disable bluetooth.service


# Reducing the brightness of the screen by 2 times from the maximum

read B < /sys/class/backlight/intel_backlight/max_brightness
C=$B
let A=$C/2
sudo echo $A > /sys/class/backlight/intel_backlight/brightness


# Disabling the NMI Watchdog Core Technology

echo 0 > /proc/sys/kernel/nmi_watchdog


# Changing the write time to virtual memory

echo 6000 > /proc/sys/vm/dirty_writeback_centisecs

else # If charging is enabled


# Editing APM hard drives on 248

if grep "1" /sys/block/sd*/queue/rotational # Checking on hdd
then
sudo hdparm -B 248 -S 0 /dev/sd*
fi


# Disabling the audio card power saving mode

echo 0 > /sys/module/snd_hda_intel/parameters/power_save


# Enabling bluetooth

systemctl enable bluetooth.service


# Returning the screen brightness level to the maximum

cat /sys/class/backlight/intel_backlight/max_brightness > /sys/class/backlight/intel_backlight/brightness


# Enaabling the NMI Watchdog Core Technology

echo 1 > /proc/sys/kernel/nmi_watchdog


# Changing the write time to virtual memory

echo 500 > /proc/sys/vm/dirty_writeback_centisecs

fi
