#!/bin/sh

set -u
set -e

TARGET_DIR=$1

echo "================================"
echo "Corvus-Os Post-Build Configuration"
echo "================================"

# Add Python3 and pip if Python3 is enabled
if [ -e ${TARGET_DIR}/usr/bin/python3 ]; then
    echo "Python3 detected, configuring..."
    
    # Create welcome message
    cat > ${TARGET_DIR}/etc/motd << 'MOTD'

╔═══════════════════════════════════════════════╗
║            Welcome to Corvus-Os               ║
║      Linux Distribution Made Simple           ║
║                                               ║
║  Author: Renz                                 ║
║  License: MIT                                 ║
║                                               ║
║  Integrated Features:                         ║
║    ✓ Python 3 (latest)                       ║
║    ✓ RenzmcLang Support                      ║
║    ✓ Minimal & Fast                          ║
║                                               ║
║  Type 'python3 --version' to check Python    ║
║  Type 'renzmc --version' for RenzmcLang      ║
╚═══════════════════════════════════════════════╝

MOTD
    
    echo "Corvus-Os boot configuration complete!"
else
    echo "Python3 not enabled in this build"
fi

# Note: pip install renzmc should be added to the buildroot package
# or done during first boot via network connection
echo "Post-build script completed successfully"
