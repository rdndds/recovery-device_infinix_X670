#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# This file defines the product makefiles that are available to the
# Android build system and adds specific build variants to the lunch menu.

# Add the TWRP product makefile to the list of buildable products.
PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/twrp_X670.mk

# Add the 'eng' (engineering) build variant for this TWRP product
# to the lunch menu for easy selection.
COMMON_LUNCH_CHOICES := \
    twrp_X670-eng