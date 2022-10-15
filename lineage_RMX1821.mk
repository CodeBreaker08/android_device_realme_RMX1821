#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from RMX1821 device makefile
$(call inherit-product, device/realme/RMX1821/device.mk)

# Boot Animation
TARGET_SCREEN_HEIGHT := 1520
TARGET_SCREEN_WIDTH := 720
TARGET_BOOT_ANIMATION_RES := 720

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := lineage_RMX1821
PRODUCT_DEVICE := RMX1821
PRODUCT_BRAND := Realme
PRODUCT_MODEL := Realme 3
PRODUCT_MANUFACTURER := Realme
