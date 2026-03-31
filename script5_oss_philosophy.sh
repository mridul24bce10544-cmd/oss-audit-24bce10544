#!/bin/bash
# script5_oss_philosophy.sh
# Author: Mridul Chandel | Reg No: 24BCE10544 | Slot: F11
# Description: Creates a custom markdown manifesto detailing open-source views.

echo "*********************************************"
echo "         OSS PHILOSOPHY GENERATOR            "
echo "*********************************************"
echo "Let's document your perspective on Open Source!"

read -p "1. Enter your preferred name: " DEV_NAME
read -p "2. Why does open-source matter to you? (Keep it brief): " CORE_REASON
read -p "3. Your go-to terminal command? (e.g., cd, grep, awk): " BEST_CMD

# Format the file name
DOC_NAME="philosophy_${DEV_NAME,,}.md"

echo "---------------------------------------------"
echo "Drafting your document: $DOC_NAME ..."

# Write output as a Markdown file using a HEREDOC for a cleaner look
cat <<EOF > "$DOC_NAME"
# The Open Source Philosophy of $DEV_NAME
> *Generated on: $(date '+%Y-%m-%d %H:%M:%S')*

### My Perspective
I strongly support the open-source software movement because $CORE_REASON.

### My Favorite Tool
If I were restricted to a single command-line utility forever, it would undoubtedly be \`$BEST_CMD\`.

---
*Pro Tip: Use \`cat $DOC_NAME\` in the terminal to view this anytime.*
EOF

echo "[DONE] Manifesto successfully written!"
echo "Preview of $DOC_NAME:"
echo "---------------------------------------------"
cat "$DOC_NAME"
echo "*********************************************"
