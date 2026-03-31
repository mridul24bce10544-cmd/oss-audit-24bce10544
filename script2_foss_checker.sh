#!/bin/bash
# script2_foss_checker.sh
# Author: Mridul Chandel | Reg No: 24BCE10544 | Slot: F11
# Description: Verifies Git installation and lists FOSS alternatives.

echo "*********************************************"
echo "            FOSS SOFTWARE CHECKER            "
echo "*********************************************"

# Verifying Git existence using command -v instead of which
if command -v git &> /dev/null; then
    echo "[OK] Git is currently installed."
    echo "     Running: $(git --version)"
    
    # Grab package info if dpkg is available
    if command -v dpkg &> /dev/null; then
        echo "     Summary:"
        dpkg -s git | grep -i "^Description:" | head -n 1
    fi
    echo "     License Type: GPLv2 (GNU General Public License)"
else
    echo "[WARN] Git is missing from this environment."
    echo "       Install command: sudo apt update && sudo apt install git -y"
fi

echo "---------------------------------------------"
echo "Did you know? Here are other major FOSS projects:"

SAMPLE_FOSS="core"

case $SAMPLE_FOSS in
    "git")
        echo "-> Git: Fast, decentralized version control."
        ;;
    "core")
        echo "-> Linux: The foundation of modern open-source computing."
        echo "-> Python: A highly readable, versatile programming language."
        echo "-> Nginx/Apache: The backbone web servers of the internet."
        ;;
    *)
        echo "-> Unrecognized input."
        ;;
esac
echo "*********************************************"
