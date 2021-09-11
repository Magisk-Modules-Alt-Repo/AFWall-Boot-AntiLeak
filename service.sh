#!/system/bin/sh
# Do NOT assume where your module will be located.
# ALWAYS use $MODDIR if you need to know where this script
# and module is placed.
# This will make sure your module will still work
# if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in late_start service mode
[ -n "$BG" ] || { BG=Y "$0" & exit; }
svc wifi disable && svc data disable
pidof dev.ukanth.ufirewall> /dev/null
while [ $? -ne 0 ]; do
		svc wifi disable && svc data disable
		sleep 5
		pidof dev.ukanth.ufirewall> /dev/null
	done
sleep 5
svc wifi enable && svc data enable