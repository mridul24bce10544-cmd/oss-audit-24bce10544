#!/bin/bash
# script1_sys_info.sh
# Author: Mridul Chandel | Reg No: 24BCE10544 | Slot: F11
# Description: Fetches and displays core system and user parameters.

echo "*********************************************"
echo "          SYSTEM INFORMATION REPORT          "
echo "*********************************************"

# Fetch OS details securely
if [[ -f /etc/os-release ]]; then
    DISTRO=$(grep "^PRETTY_NAME" /etc/os-release | awk -F '"' '{print $2}')
else
    DISTRO=$(uname -s)
fi

echo "Current Time    : $(date '+%A, %d %B %Y %T')"
echo "Active Distro   : $DISTRO"
echo "Kernel Release  : $(uname -r)"
echo "Current User    : $USER"
echo "Home Path       : $HOME"
echo "Uptime Status   : $(uptime -p)"
echo "---------------------------------------------"
echo ">> Note: $DISTRO runs on the open-source Linux kernel (GPL)."
echo "*********************************************"
