#!/bin/bash
# script3_storage_audit.sh
# Author: Mridul Chandel | Reg No: 24BCE10544 | Slot: F11
# Description: Scans vital directories for disk usage and access rights.

echo "*********************************************"
echo "          STORAGE & PERMISSIONS AUDIT        "
echo "*********************************************"

TARGET_PATHS="/etc /var/log /home /usr/bin /tmp"

echo "Scanning Key Directories:"
printf "%-12s | %-12s | %-20s | %s\n" "Usage" "Rights" "Owner:Group" "Path"
echo "-----------------------------------------------------------------"

for fldr in $TARGET_PATHS; do
    if [[ -d "$fldr" ]]; then
        # Suppress errors for permission denied
        SIZE_VAL=$(sudo du -sh "$fldr" 2>/dev/null | awk '{print $1}' || echo "N/A")
        
        # Extract permissions and ownership
        RIGHTS=$(ls -ld "$fldr" | awk '{print $1}')
        OWNER_GRP=$(ls -ld "$fldr" | awk '{print $3":"$4}')
        
        printf "%-12s | %-12s | %-20s | %s\n" "$SIZE_VAL" "$RIGHTS" "$OWNER_GRP" "$fldr"
    else
        echo "[!] Path not found: $fldr"
    fi
done

echo "---------------------------------------------"
echo "Checking Git Preferences:"

GLOBAL_GIT="$HOME/.gitconfig"

if [[ -f "$GLOBAL_GIT" ]]; then
    echo "[OK] Global config located at $GLOBAL_GIT"
    echo "     File Rights: $(ls -ld "$GLOBAL_GIT" | awk '{print $1}')"
else
    echo "[!] No global configuration found at $GLOBAL_GIT."
    echo "     Hint: Run 'git config --global user.name \"Your Name\"'"
fi
echo "*********************************************"  
