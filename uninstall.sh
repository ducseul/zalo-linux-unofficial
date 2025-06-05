#!/bin/bash
# Exit on error
set -e

# If running in relocation mode
if [[ "$1" == "--do-delete" ]]; then
    rm -rf ~/.local/share/applications/Zalo.desktop \
           ~/Desktop/Zalo.desktop \
           /tmp/zalo-installer \
           ~/.local/share/Zalo

    update-desktop-database ~/.local/share/applications || true
    echo "Uninstall Zalo success."
    exit 0
fi

# Relocate and run from a safe place
TMP_SCRIPT="/tmp/zalo_uninstall.sh"
cp "$0" "$TMP_SCRIPT"
chmod +x "$TMP_SCRIPT"
"$TMP_SCRIPT" --do-delete &
exit 0
