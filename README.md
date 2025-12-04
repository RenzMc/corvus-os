# Corvus-Os

Corvus-Os adalah distribusi Linux minimal yang dibangun menggunakan Buildroot, dirancang untuk booting dengan emulator dan sebagai mesin virtual.

## Fitur Utama

- **Ringan & Minimal**: Build OS yang super ringan dan efisien
- **Python Terintegrasi**: Python terbaru sudah terinstall otomatis
- **RenzmcLang Support**: Bahasa pemrograman Indonesia (renzmc) sudah terinstall
- **Multi-Architecture**: Support untuk x86_64 (amd64) dan aarch64 (arm64)
- **Multiple Boot Options**: QEMU, UEFI, ISO, dan Disk Image

## Quick Start

```bash
git clone --branch=2023.02.x https://github.com/buildroot/buildroot
cd buildroot
make BR2_EXTERNAL=.. <target>_defconfig
make
```

## Target Build

| Target   | x86_64 (amd64)              | aarch64 (arm64)              |
| -------- | --------------------------- | ---------------------------- |
| QEMU     | qemu_x86_64_defconfig       | qemu_aarch64_virt_defconfig  |
| UEFI     | pc_x86_64_efi_defconfig     | aarch64_efi_defconfig        |
| IMG      | img_x86_64_defconfig        | img_aarch64_defconfig        |
| ISO      | iso_x86_64_defconfig        | iso_aarch64_defconfig        |

## Menjalankan OS

### QEMU Image Mode
```bash
./run-img-amd64.sh   # untuk x86_64
./run-img-arm64.sh   # untuk aarch64
```

### ISO Mode
```bash
./run-iso-amd64.sh   # untuk x86_64
./run-iso-arm64.sh   # untuk aarch64
```

## Struktur Project

- `board/` - Board configurations
- `configs/` - Build configurations
- `kernel/` - Linux kernel configs
- `container/` - Docker build support

## License

MIT License - Copyright (c) 2025 Renz

---

**Corvus-Os** - Linux Distribution Made Simple
