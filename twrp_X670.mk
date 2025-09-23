#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# ===================================================================
# Inherit Product Configurations
# ===================================================================

# Inherit the common TWRP product configuration
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit the base device-specific product configuration
$(call inherit-product, device/infinix/X670/device.mk)

# ===================================================================
# Product Identity
# ===================================================================
# These variables define the device's brand, name, and model
# to ensure the build is correctly identified.

PRODUCT_BRAND := Infinix
PRODUCT_DEVICE := X670
PRODUCT_MANUFACTURER := infinix
PRODUCT_MODEL := Infinix NOTE 12
PRODUCT_NAME := twrp_X670

# Set the GMS Client ID base
PRODUCT_GMS_CLIENTID_BASE := android-infinix

# ===================================================================
# Build Properties & Fingerprint
# ===================================================================
# Override build properties to match the stock firmware. This can
# be necessary for proper functionality or passing security checks.

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="vnd_x670_h814-user 12 SP1A.210812.016 548390 release-keys"

# Set the build fingerprint to match the stock firmware
BUILD_FINGERPRINT := Infinix/X670-GL/Infinix-X670:12/SP1A.210812.016/240224V150:user/release-keys