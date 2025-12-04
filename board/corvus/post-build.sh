#!/bin/bash
# Post-build script for Corvus OS
# Author: RenzMc

echo "Running Corvus OS post-build configuration..."

# Create directories for RenzMcLang
mkdir -p $TARGET_DIR/usr/share/renzmc/{examples,docs,scripts}
mkdir -p $TARGET_DIR/usr/local/bin

# Create RenzMcLang welcome script
cat > $TARGET_DIR/usr/share/renzmc/scripts/welcome.rmc << 'EOF'
// ============================================
// Corvus OS - Welcome Script
// Author: RenzMc
// ============================================

tampilkan "================================"
tampilkan "  Selamat datang di Corvus OS!"
tampilkan "  Sistem Operasi Ringan & Powerful"
tampilkan "  Dengan integrasi RenzMcLang"
tampilkan "  GUI: Weston Wayland"
tampilkan "================================"
tampilkan ""

// Sistem informasi
nama_os itu "Corvus OS"
versi itu "0.0.1"
bahasa itu "RenzMcLang"
author itu "RenzMc"
gui itu "Weston Wayland"

tampilkan "Sistem Operasi : " + nama_os
tampilkan "Versi          : " + versi
tampilkan "Bahasa          : " + bahasa
tampilkan "Pembuat         : " + author
tampilkan "GUI             : " + gui
tampilkan ""

// Test perhitungan
tampilkan "Test kalkulasi RenzMcLang:"
a itu 15
b itu 10
tampilkan a + " + " + b + " = " + (a + b)
tampilkan a + " * " + b + " = " + (a * b)
tampilkan ""

// Test array/list
fitur itu ["Ringan", "Cepat", "Sederhana", "Powerful", "GUI"]
tampilkan "Fitur Corvus OS:"
untuk setiap item dari fitur
    tampilkan "  - " + item
selesai

tampilkan ""
tampilkan "Corvus OS dengan GUI siap digunakan!"
tampilkan "Jalankan 'weston' untuk memulai GUI"
tampilkan "================================"
EOF

# Make scripts executable
chmod +x $TARGET_DIR/usr/share/renzmc/scripts/*.rmc

# Create RenzMcLang configuration
cat > $TARGET_DIR/etc/renzmc.conf << 'EOF'
# RenzMcLang Configuration for Corvus OS
# Author: RenzMc

# Default settings
RENZMC_HOME=/usr/share/renzmc
RENZMC_EXAMPLES=$RENZMC_HOME/examples
RENZMC_SCRIPTS=$RENZMC_HOME/scripts

# Python integration
PYTHONPATH=/usr/local/lib/python*/site-packages:$PYTHONPATH

# Performance settings
JIT_ENABLED=true
OPTIMIZATION_LEVEL=2

# GUI settings
GUI_ENABLED=true
WESTON_CONFIG=/etc/weston.ini
EOF

# Create custom Weston launcher script
cat > $TARGET_DIR/usr/bin/start-weston << 'EOF'
#!/bin/bash
# Corvus OS Weston Launcher
# Author: RenzMc

echo "Starting Corvus OS Weston GUI..."

# Set up environment
export XDG_RUNTIME_DIR=/tmp
export WAYLAND_DISPLAY=wayland-0
export EGL_PLATFORM=wayland

# Create runtime directory
mkdir -p $XDG_RUNTIME_DIR
chmod 700 $XDG_RUNTIME_DIR

# Start Weston with custom config
if [ -f /etc/weston.ini ]; then
    weston --config=/etc/weston.ini
else
    weston --backend=drm-backend.so --shell=desktop-shell.so
fi
EOF

chmod +x $TARGET_DIR/usr/bin/start-weston

# Create desktop entry for Weston terminal
mkdir -p $TARGET_DIR/usr/share/applications
cat > $TARGET_DIR/usr/share/applications/weston-terminal.desktop << 'EOF'
[Desktop Entry]
Version=1.0
Name=Corvus Terminal
Comment=Terminal emulator for Corvus OS
Exec=weston-terminal
Icon=utilities-terminal
Terminal=false
Type=Application
Categories=System;TerminalEmulator;
EOF

# Create Weston user directory structure
mkdir -p $TARGET_DIR/home/corvus/.config
mkdir -p $TARGET_DIR/home/corvus/.local/share

# Copy custom wallpaper to user home
mkdir -p $TARGET_DIR/home/corvus/.local/share/wallpapers
cp board/corvus/os-overlay/usr/share/wallpapers/corvus-default.png $TARGET_DIR/home/corvus/.local/share/wallpapers/

# Create user weston config with wallpaper
mkdir -p $TARGET_DIR/home/corvus/.config/weston
cat > $TARGET_DIR/home/corvus/.config/weston.ini << 'EOF'
[core]
backend=drm-backend.so
shell=desktop-shell.so

[shell]
client=/usr/bin/weston-terminal
background-type=image
background-image=/home/corvus/.local/share/wallpapers/corvus-default.png
EOF

chown -R corvus:corvus $TARGET_DIR/home/corvus 2>/dev/null || true

# Add corvus user
if [ -x $TARGET_DIR/usr/sbin/adduser ]; then
    $TARGET_DIR/usr/sbin/adduser -D -s /bin/sh corvus
    echo "corvus:corvus" | chpasswd 2>/dev/null || true
fi

echo "Corvus OS post-build configuration completed."