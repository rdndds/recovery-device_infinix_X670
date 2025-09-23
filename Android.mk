#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Define the local path to the current directory
LOCAL_PATH := $(call my-dir)

# Conditionally include makefiles from subdirectories only when
# building for the target device "X670". This prevents these
# rules from being processed for other device builds.
ifeq ($(TARGET_DEVICE),X670)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif