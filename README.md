# nate-omarchy

Konfigurasi Omarchy Linux dengan dual-shell: **Omarchy Shell** dan **Caelestia Shell**.

## Struktur

```
├── hypr/        → ~/.config/hypr/        (Hyprland WM config)
├── omarchy/     → ~/.config/omarchy/     (Omarchy shell config)
├── caelestia/   → ~/.config/caelestia/   (Caelestia shell config)
├── scripts/     → ~/.local/bin/          (toggle-shell, caelestia-launcher)
└── hooks/       → ~/.config/omarchy/hooks/
```

## Fitur

- **Dual Shell**: Beralih antara Omarchy Shell & Caelestia Shell via `SUPER+CTRL+S`
- **Toggle Script**: `toggle-shell` — kill shell aktif, jalankan shell lainnya
- **Launcher**: `SUPER+SPACE` — otomatis mendeteksi shell aktif
- **Auto-start**: Shell terakhir tersimpan otomatis di `~/.cache/shell-mode`

## Restore

```bash
./restore.sh
```

Atau salin manual file dari folder ke path yang sesuai.
