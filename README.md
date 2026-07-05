# nate-omarchy

Konfigurasi [Omarchy Linux](https://omarchy.org/) — Arch Linux + Hyprland — dengan dual-shell: **Omarchy Shell** dan **Caelestia Shell**.

## Struktur

```
nate-omarchy/
├── hypr/          → ~/.config/hypr/        (Hyprland: bindings, monitors, autostart, dll)
├── omarchy/       → ~/.config/omarchy/     (Omarchy shell layout & plugins)
├── caelestia/     → ~/.config/caelestia/   (Caelestia shell: bar, dashboard, OSD, dll)
├── scripts/       → ~/.local/bin/          (toggle-shell, caelestia-launcher)
├── hooks/         → ~/.config/omarchy/hooks/
├── restore.sh     → Script restore semua config
└── README.md
```

## Fitur

| Fitur | Keterangan |
|-------|-----------|
| **Dual Shell** | Beralih antara Omarchy Shell & Caelestia Shell kapan saja |
| **Toggle Shell** | `SUPER + CTRL + S` — kill shell aktif, jalankan shell lain |
| **Smart Launcher** | `SUPER + SPACE` — otomatis deteksi shell aktif |
| **Auto-start** | Shell terakhir tersimpan otomatis di `~/.cache/shell-mode` |

### Perbandingan Shell

| Aspek | Omarchy Shell | Caelestia Shell |
|-------|--------------|-----------------|
| Bar | Minimal (menu, workspaces, clock, tray) | Full-featured (workspaces, active window, status icons, power) |
| Dashboard | Tidak ada | Media, performance, weather |
| Launcher | Omarchy menu | App launcher + calculator + scheme/wallpaper changer |
| Notifications | Omarchy OSD | Full notification center + sidebar |
| Lock Screen | Omarchy lock | Caelestia lock screen |
| OSD | Terbatas | Brightness, volume, microphone |
| Desktop Clock | Tidak ada | Ada (bisa diaktifkan) |
| Audio Visualiser | Tidak ada | Ada (bisa diaktifkan) |
| Settings Panel | Omarchy menu | Nexus GUI settings |

## Cara Penggunaan

### Instalasi/Pindah ke Mesin Baru

```bash
# Clone repo
git clone https://github.com/natedekaka/nate-omarchy.git ~/nate-omarchy

# Restore semua config
cd ~/nate-omarchy && ./restore.sh

# Apply Hyprland config
hyprctl reload
```

### Beralih Shell

Tekan **`SUPER + CTRL + S`** untuk beralih antara:

- **Omarchy Shell** — bar minimal + Omarchy menu
- **Caelestia Shell** — bar lengkap, dashboard, launcher canggih, lock screen, OSD, dll

Atau dari terminal:

```bash
toggle-shell
```

### Membuka Launcher

**`SUPER + SPACE`** — otomatis membuka launcher sesuai shell aktif:

- **Caelestia mode**: App launcher dengan search, calculator (`>`), color scheme changer, dan wallpaper picker
- **Omarchy mode**: Omarchy application menu

### Aplikasi yang Terdaftar

| Shortcut | Aplikasi |
|----------|----------|
| `SUPER + RETURN` | Terminal |
| `SUPER + ALT + RETURN` | Tmux |
| `SUPER + SHIFT + RETURN` | Browser |
| `SUPER + SHIFT + F` | File Manager |
| `SUPER + SHIFT + M` | Music (Spotify) |
| `SUPER + SHIFT + N` | Editor |
| `SUPER + SHIFT + G` | Signal |
| `SUPER + SHIFT + O` | Obsidian |
| `SUPER + M` | Toggle Layout (master/dwindle) |

### Keybinding Lainnya

| Shortcut | Fungsi |
|----------|--------|
| `SUPER + Q` | Tutup window |
| `SUPER + SPACE` | Launcher |
| `SUPER + CTRL + S` | Toggle shell |
| `PRINT` | Screenshot |
| `ALT + PRINT` | Screen recording |
| `SUPER + PRINT` | Color picker |
| `SUPER + BACKSPACE` | Toggle window transparency |
| `SUPER + SHIFT + BACKSPACE` | Toggle window gaps |

### Caelestia Shell — Fitur Khusus

#### Desktop Clock
Aktif/nonaktifkan di `~/.config/caelestia/shell.json`:
```json
"background": {
    "desktopClock": {
        "enabled": true,
        "position": "bottom-right"
    }
}
```

#### Audio Visualiser
```json
"background": {
    "visualiser": {
        "enabled": true,
        "autoHide": true
    }
}
```

#### Dashboard
Geser dari tepi kiri layar — menampilkan media, performance, dan cuaca.

#### Session Menu
Tekan shortcut session (atau akses dari launcher) — menu power/logout overlay.

#### Nexus Settings Panel
Buka launcher → ketik "Settings" — GUI pengaturan shell.

#### IPC Commands
```bash
caelestia shell drawers toggle launcher    # Buka/tutup launcher
caelestia shell drawers toggle dashboard   # Buka/tutup dashboard
caelestia shell lock lock                  # Kunci layar
caelestia shell wallpaper set ~/gambar.jpg # Ganti wallpaper
caelestia shell -s                         # Lihat semua perintah IPC
```

### Omarchy Shell — Perintah Berguna

```bash
omarchy theme list              # Daftar tema
omarchy theme set "Tokyo Night" # Ganti tema
omarchy theme bg next           # Ganti wallpaper
omarchy update                  # Update sistem
omarchy reminder 15 "Meeting"   # Set reminder
omarchy capture screenshot      # Screenshot
```

## Kustomisasi

### Edit Konfigurasi

```bash
# Hyprland
vim ~/.config/hypr/bindings.lua      # Keybindings
vim ~/.config/hypr/monitors.conf      # Monitor setup
vim ~/.config/hypr/autostart.lua      # Autostart programs
vim ~/.config/hypr/looknfeel.lua      # Tampilan (gaps, borders, animations)

# Shell
vim ~/.config/omarchy/shell.json      # Omarchy bar layout
vim ~/.config/caelestia/shell.json    # Caelestia features
```

### Ganti Tema Omarchy

```bash
omarchy theme list
omarchy theme set "Catppuccin Mocha"
```

Tema kustom bisa ditambahkan di `~/.config/omarchy/themes/`.

### Buat Toggle Sendiri

Contoh hook `~/.config/omarchy/hooks/theme-set`:
```bash
#!/bin/bash
notify-send "Theme changed to: $1"
```

## Troubleshooting

### Launcher tidak muncul (SUPER+SPACE)
```bash
# Cek shell aktif
cat ~/.cache/shell-mode

# Jalankan manual
caelestia-launcher
```

### Shell tidak bisa toggle
```bash
# Cek proses
ps aux | grep -E "qs -c caelestia|quickshell"

# Kill manual
pkill -f "qs -c caelestia"
pkill -x quickshell

# Start manual
toggle-shell
```

### Config error setelah edit
```bash
hyprctl reload && hyprctl configerrors
```

## Restore

```bash
git clone https://github.com/natedekaka/nate-omarchy.git
cd nate-omarchy
./restore.sh
hyprctl reload
```
