#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/realme/RMX1821

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/aosp_RMX1821.mk

COMMON_LUNCH_CHOICES := \
    aosp_RMX1821-user \
    aosp_RMX1821-userdebug \
    aosp_RMX1821-eng
