-- Extra autostart processes.
-- o.launch_on_start("my-service")

-- Alihkan audio ke HDMI jika TV terhubung
o.exec_on_start("bash -c 'sleep 2 && pactl set-card-profile alsa_card.pci-0000_03_00.1 output:hdmi-stereo 2>/dev/null && pw-metadata -n default 0 default.audio.sink \"{ \\\"name\\\": \\\"alsa_output.pci-0000_03_00.1.hdmi-stereo\\\" }\" 2>/dev/null'")

o.exec_on_start("bash -c 'sleep 0.5 && STATE=\"$HOME/.cache/shell-mode\"; CAELESTIA_DIR=\"$HOME/.config/quickshell/caelestia\"; export QML2_IMPORT_PATH=\"$CAELESTIA_DIR/build/qml:$HOME/.local/caelestia-test/qt6/qml:${QML2_IMPORT_PATH:-}\"; if [ -f \"$STATE\" ] && [ \"$(cat \"$STATE\")\" = \"omarchy\" ]; then toggle-shell; else qs -c caelestia -d >/dev/null 2>&1 & fi'")
