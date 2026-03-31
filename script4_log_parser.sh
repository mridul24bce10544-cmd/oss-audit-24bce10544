#!/bin/bash
# script4_log_parser.sh
# Author: Mridul Chandel | Reg No: 24BCE10544 | Slot: F11
# Description: Scans a designated log file for specific keywords.

echo "*********************************************"
echo "             SYSTEM LOG PARSER               "
echo "*********************************************"

TARGET_LOG=$1
SEARCH_TERM=${2:-"warning"} # Swapped default to 'warning'

if [[ -z "$TARGET_LOG" ]]; then
    echo "Usage: ./script4_log_parser.sh <log_file_path> [search_term]"
    echo "Example: ./script4_log_parser.sh /var/log/syslog error"
    exit 1
fi

if [[ ! -r "$TARGET_LOG" ]]; then
    echo "[ERROR] Cannot read '$TARGET_LOG'."
    echo "        Verify the file path or use 'sudo' for elevated logs."
    exit 1
fi

echo "Target File   : $TARGET_LOG"
echo "Looking for   : '$SEARCH_TERM' (Ignoring case)"
echo "---------------------------------------------"

HITS=0
CAPTURED_LINES=""

while IFS= read -r current_line; do
    if echo "$current_line" | grep -iq "$SEARCH_TERM"; then
        ((HITS++))
        CAPTURED_LINES+="$current_line\n"
    fi
done < "$TARGET_LOG"

echo "Total Matches Found: $HITS"

if [[ "$HITS" -gt 0 ]]; then
    echo "---------------------------------------------"
    echo "Recent occurrences:"
    echo -e "$CAPTURED_LINES" | tail -n 6 | head -n 5
else
    echo "Status: Clean. No entries for '$SEARCH_TERM' detected."
fi

echo "*********************************************"
