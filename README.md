# Omarchy

Omarchy is a beautiful, modern & opinionated Linux distribution by DHH.

Read more at [omarchy.org](https://omarchy.org).

## Docs

- [omarchy-shell](docs/omarchy-shell.md) — shell host, plugin manifest, IPC, `shell.json`, custom bar modules

## Panduan Restore dari Fork

Fork ini berisi **kode Omarchy + semua modifikasi** (Dracula theme, weather Cimahi, crash fix, dsb).
Untuk mengembalikan sistem seperti di laptop ini:

### 1. Install Arch Linux
Install Arch Linux biasa sampai masuk desktop. Pastikan koneksi internet.

### 2. Install Omarchy
```bash
# Clone repo asli Omarchy
git clone https://github.com/basecamp/omarchy.git /tmp/omarchy
cd /tmp/omarchy

# Install Omarchy (lihat dokumentasi resmi untuk langkah lengkap)
bin/omarchy-setup-system
bin/omarchy-finalize-user
```

### 3. Ganti dengan fork ini
```bash
# Hapus repo asli, ganti dengan fork
cd ~/.local/share/omarchy
git remote set-url origin https://github.com/natedekaka/nate-omarchy.git
git fetch origin
git checkout -b omarchy-4 origin/omarchy-4
```

### 4. Terapkan tema & konfigurasi
```bash
# Theme Dracula sudah termasuk, tinggal aktifkan
omarchy-theme-set dracula
```

### 5. Kustomisasi tambahan
- Setting bar (shell.json), keybindings, dll. ada di `~/.config/` — perlu disetel manual atau backup terpisah.

## Local Fork — Update & Push

Setup remote fork (sekali saja):
```bash
git remote add fork https://github.com/natedekaka/nate-omarchy.git
```

Update dari repo asli & sinkronisasi ke fork:
```bash
git checkout omarchy-4            # pastikan di branch ini
git pull origin omarchy-4         # ambil update terbaru dari basecamp/omarchy
git push fork omarchy-4           # sinkronisasi ke natedekaka/nate-omarchy
```

## License

Omarchy is released under the [MIT License](https://opensource.org/licenses/MIT).
