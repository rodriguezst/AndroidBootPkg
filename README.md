# AndroidBootPkg 
An UEFI application to set a specific value at a certain address to trigger a reboot to Android. Boot image needs to be patched to support this.

## Prerequisites

- EDK2 development environment
- GCC toolchain (GCC5 or newer)
- Make
- Python 3
- Build essentials (gcc, g++, uuid-dev, etc.)

## Setting up EDK2

1. Install required packages:
   ```bash
   sudo apt-get install build-essential uuid-dev iasl git gcc-aarch64-linux-gnu python3-distutils
   ```

2. Clone EDK2:
   ```bash
   git clone https://github.com/tianocore/edk2.git
   cd edk2
   git submodule update --init
   ```

## Building

1. Build the package:
   ```bash
   make
   ```

The first build will automatically:
- Build EDK2 BaseTools
- Configure EDK2 environment
- Build the application

Additional make targets:
- `make clean` - Clean build artifacts
- `make rebuild` - Clean and rebuild
- `make info` - Show build configuration

## Build Configuration

You can customize the build by setting these variables:
- `ARCH`: Target architecture (default: AARCH64)
- `TOOLCHAIN`: Toolchain to use (default: GCC5)
- `BUILD_TYPE`: Build type (default: RELEASE)

Example:
```bash
make ARCH=AARCH64 BUILD_TYPE=RELEASE
```

## Output

The built EFI application will be available at:
`Build/AndroidBootPkg/$(BUILD_TYPE)_$(TOOLCHAIN)/$(ARCH)/C0DEADDED.efi`
