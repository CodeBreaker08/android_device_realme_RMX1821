#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Get non-open-source specific aspects
$(call inherit-product, vendor/realme/RMX1821/RMX1821-vendor.mk)

# Input Configs
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/input/idc/AVRCP.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/AVRCP.idc \
	$(DEVICE_PATH)/configs/input/keylayout/ACCDET.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/ACCDET.kl \
	$(DEVICE_PATH)/configs/input/keylayout/AVRCP.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/AVRCP.kl

# Ramdisk
PRODUCT_PACKAGES += \
	factory_init.connectivity.rc \
	factory_init.project.rc \
	factory_init.rc \
	fstab.enableswap \
	fstab.mt6771 \
	init.aee.rc \
	init.ago.rc \
	init.connectivity.rc \
	init.modem.rc \
	init.mt6771.rc \
	init.mt6771.usb.rc \
	init.oppo.reserve.rc \
	init.project.rc \
	init.sensor_1_0.rc \
	meta_init.connectivity.rc \
	meta_init.modem.rc \
	meta_init.project.rc \
	meta_init.rc \
	multi_init.rc \
	ueventd.rc

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
	$(DEVICE_PATH)
