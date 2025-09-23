#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# ===================================================================
# Inherit from Base Product Configurations
# ===================================================================
# Most specific configurations should be listed first.

# Inherit the core AOSP product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Inherit 64-bit primary architecture settings
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Inherit support for emulated storage
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Install GSI keys to allow booting developer GSI with verified boot
[cite_start]$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk) [cite: 6]

# Inherit Virtual A/B OTA configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# ===================================================================
# Product Information
# ===================================================================

# Set the shipping API level and target VNDK version for the product
PRODUCT_SHIPPING_API_LEVEL := 31
PRODUCT_TARGET_VNDK_VERSION := 31

# ===================================================================
# Virtual A/B & Dynamic Partitions
# ===================================================================

# Enable Virtual A/B and dynamic partitions
ENABLE_VIRTUAL_AB := true
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Configure the A/B OTA updater
AB_OTA_UPDATER := true

# Define the list of partitions that are updated via A/B OTAs
AB_OTA_PARTITIONS += \
    boot \
    product \
    system \
    system_ext \
    vbmeta_system \
    vbmeta_vendor \
    vendor

# Configure post-install actions for the system partition during an OTA
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true

# ===================================================================
# Product Packages
# ===================================================================

PRODUCT_PACKAGES += \
    # Boot Control HAL (for managing A/B slots)
    android.hardware.boot@1.2-mtkimpl \
    android.hardware.boot@1.2-mtkimpl.recovery \
    # Fastbootd (userspace fastboot implementation)
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd \
    # Health HAL (for battery and charging status)
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service \
    # A/B OTA and Update Engine components
    cppreopts.sh \
    otapreopt_script \
    update_engine \
    update_engine_sideload \
    update_verifier

# Packages to include only in debug builds
PRODUCT_PACKAGES_DEBUG += \
    bootctrl \
    update_engine_client