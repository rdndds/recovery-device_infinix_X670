#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# ===================================================================
# Basic Device Setup
# ===================================================================

# Set the path to the device tree root
DEVICE_PATH := device/infinix/X670

# Allow building with a minimal manifest, ignoring missing dependencies
ALLOW_MISSING_DEPENDENCIES := true

# ===================================================================
# Architecture
# ===================================================================

# Define the primary architecture (64-bit)
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT_RUNTIME := cortex-a53

# Define the secondary architecture (32-bit)
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a53

# Enable support for 64-bit applications
TARGET_SUPPORTS_64_BIT_APPS := true

# ===================================================================
# Platform & Bootloader
# ===================================================================

# Specify the board's platform and bootloader name
TARGET_BOARD_PLATFORM := mt6781
TARGET_BOOTLOADER_BOARD_NAME := Infinix-X670

# Disable building a separate bootloader image
TARGET_NO_BOOTLOADER := true

# ===================================================================
# Kernel Configuration
# ===================================================================

# Specify the path to the prebuilt kernel and DTB image
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img

# Set boot image header version
BOARD_BOOTIMG_HEADER_VERSION := 2

# Kernel command line arguments
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2

# Kernel memory layout and properties
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x07c08000
BOARD_KERNEL_TAGS_OFFSET := 0x0bc08000
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

# Arguments for the mkbootimg tool
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)

# ===================================================================
# Partitions & Filesystems
# ===================================================================

# Set the path to the recovery fstab
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab

# Dynamic Partitions Configuration
BOARD_SUPER_PARTITION_SIZE := 8490450944
BOARD_SUPER_PARTITION_GROUPS := main
BOARD_MAIN_SIZE := 8490450940 # (BOARD_SUPER_PARTITION_SIZE - 4MB for metadata)
BOARD_MAIN_PARTITION_LIST := \
    product \
    system \
    system_ext \
    vendor

# Individual partition sizes
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432

# Specify filesystem types for partitions
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := erofs

# Enable support for ext4 and f2fs on user images
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# ===================================================================
# System & Build Properties
# ===================================================================

# Set the path to the system properties file
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Assert device for OTA updates to prevent flashing on incorrect models
TARGET_OTA_ASSERT_DEVICE := Infinix-X670,X670

# Enable Android Verified Boot (AVB)
BOARD_AVB_ENABLE := true

# This device does not use a system-as-root configuration
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false

# Specify the output directories for partitions to handle non-SAR layouts
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor

# ===================================================================
# TWRP Configuration
# ===================================================================

# Core Recovery Flags
TARGET_NO_RECOVERY := true
BOARD_USES_RECOVERY_AS_BOOT := true
TW_HAS_NO_RECOVERY_PARTITION := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SUPPRESS_SECURE_ERASE := true

# UI & Theme Settings
TW_THEME := portrait_hdpi
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TW_FRAMERATE := 60
TW_EXTRA_LANGUAGES := false

# Brightness control path and values
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 100 # Adjusted for better visibility

# Status bar icon alignment
TW_STATUS_ICONS_ALIGN := center
TW_CUSTOM_CLOCK_POS := 40
TW_CUSTOM_CPU_POS := 270

# Feature Flags
TW_USE_TOOLBOX := true
TW_HAS_MTP := true
TW_NO_FASTBOOT_BOOT := true
TW_NO_FLASH_CURRENT_TWRP := true
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true

# TWRP version identifier
TW_DEVICE_VERSION := R

# Included Tools & Utilities
TW_INCLUDE_FASTBOOTD := true
TW_INCLUDE_LIBRESETPROP := true
TW_INCLUDE_LPTOOLS := true
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_RESETPROP := true

# Excluded Apps & Utilities
TW_EXCLUDE_APEX := true
TW_EXCLUDE_BASH := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXCLUDE_LPDUMP := true
TW_EXCLUDE_NANO := true
TW_EXCLUDE_PYTHON := true
TW_EXCLUDE_SUPERSU := true
TW_EXCLUDE_TWRPAPP := true
TW_EXCLUDE_TZDATA := true

# ===================================================================
# TWRP Encryption
# ===================================================================

# Enable support for cryptographic operations
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
BOARD_USES_METADATA_PARTITION := true

# Spoof platform versions to help with decryption on newer devices
PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)