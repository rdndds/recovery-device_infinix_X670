# TWRP Device Tree for Infinix NOTE 12 (X670)

This repository contains the device tree for building TWRP (Team Win Recovery Project) for the Infinix NOTE 12 (X670) device.

## Device Specifications
- **Device**: Infinix NOTE 12
- **Codename**: X670
- **SoC**: MediaTek MT6781 (Helio G96)
- **Android Version**: Android 12

## Features
- [x] Touchscreen support
- [x] ADB support
- [x] MTP support
- [x] Decryption
- [x] Screen brightness control
- [x] Back and power button controls

## Build Instructions
1. Set up the Android build environment
2. Initialize the TWRP source:
   ```bash
   repo init --depth=1 -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-12.1
   ```
3. Sync the source:
   ```bash
   repo sync -j$(nproc --all) --force-sync
   ```
4. Clone this device tree into your source:
   ```bash
   git clone https://github.com/rdndds/recovery-device_infinix_X670 device/infinix/X670
   ```
5. Build TWRP:
   ```bash
   source build/envsetup.sh
   lunch twrp_X670-eng
   mka bootimage
   ```

## Warnings
⚠️ **Use at your own risk!** 
- This is experimental software
- Backup your data before flashing
- Bricking is possible if done incorrectly
- Make sure you understand the risks involved

## Disclaimer
This is an unofficial build and should be considered experimental. Contributions and testing are welcome to improve stability and functionality.