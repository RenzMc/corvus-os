# Corvus OS - Lightweight Linux Distribution

## Development

### Building Corvus OS

```bash
# Clone the repository
git clone https://github.com/RenzMc/CorvusOS.git
cd CorvusOS/buildroot

# Configure build
make coros_os_defconfig

# Build the system
make -j$(nproc)

# Run in QEMU
make qemu
```

### Directory Structure

```
CorvusOS/
├── buildroot/          # Buildroot system
├── package/
│   └── coros-renzmc/   # RenzMcLang integration package
├── board/
│   └── coros/          # Board-specific configurations
└── configs/
    └── coros_os_defconfig
```

## Support

### Documentation
- **RenzMcLang Docs**: [renzmc-docs.vercel.app](https://renzmc-docs.vercel.app/)
- **GitHub Repository**: [github.com/RenzMc/RenzmcLang](https://github.com/RenzMc/RenzmcLang)
## License

Corvus OS is licensed under the MIT License. See LICENSE file for details.

## Contributing

Contributions are welcome! Please feel free to submit issues and enhancement requests.

**Corvus OS - Lightweight, Powerful, Simple**
