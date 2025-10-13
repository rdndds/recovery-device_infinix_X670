#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit the core AOSP product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Inherit 64-bit primary architecture settings
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Inherit support for emulated storage
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Install GSI keys to allow booting developer GSI with verified boot
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Inherit Virtual A/B OTA configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

PRODUCT_SHIPPING_API_LEVEL := 31
PRODUCT_TARGET_VNDK_VERSION := 31

ENABLE_VIRTUAL_AB := true
PRODUCT_USE_DYNAMIC_PARTITIONS := true

AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    product \
    system \
    system_ext \
    vbmeta_system \
    vbmeta_vendor \
    vendor

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-mtkimpl \
    android.hardware.boot@1.2-mtkimpl.recovery \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service \
    cppreopts.sh \
    otapreopt_script \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES_DEBUG += \
    bootctrl \
    update_engine_client