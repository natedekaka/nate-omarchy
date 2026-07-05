#!/bin/bash
# Restore all config files to their proper locations

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Restoring Hyprland config..."
cp -r "$SCRIPT_DIR/hypr/"* ~/.config/hypr/

echo "Restoring Omarchy config..."
cp "$SCRIPT_DIR/omarchy/shell.json" ~/.config/omarchy/

echo "Restoring Caelestia config..."
cp "$SCRIPT_DIR/caelestia/shell.json" ~/.config/caelestia/
[ -d "$SCRIPT_DIR/caelestia/monitors" ] && cp -r "$SCRIPT_DIR/caelestia/monitors/"* ~/.config/caelestia/monitors/

echo "Restoring scripts..."
cp "$SCRIPT_DIR/scripts/"* ~/.local/bin/
chmod +x ~/.local/bin/toggle-shell ~/.local/bin/caelestia-launcher

echo "Restoring hooks..."
[ -d "$SCRIPT_DIR/hooks" ] && cp "$SCRIPT_DIR/hooks/"* ~/.config/omarchy/hooks/ 2>/dev/null

echo "Done! Run 'hyprctl reload' to apply Hyprland changes."
