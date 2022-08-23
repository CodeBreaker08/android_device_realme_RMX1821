#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Get non-open-source specific aspects
$(call inherit-product, vendor/realme/RMX1821/RMX1821-vendor.mk)

# IMS
$(call inherit-product, vendor/realme/RMX1821-ims/RMX1821-ims.mk)

# PRODUCT_SHIPPING_API_LEVEL indicates the first api level, device has been commercially launched on.
PRODUCT_SHIPPING_API_LEVEL := 28

# Audio
PRODUCT_PACKAGES += \
	android.hardware.audio@2.0.vendor \
	android.hardware.audio@4.0.vendor \
	android.hardware.audio@5.0.vendor \
	android.hardware.audio.common@5.0-util.vendor \
	android.hardware.bluetooth.audio@2.0-impl

PRODUCT_PACKAGES += \
	audio.bluetooth.default \
	audio.r_submix.default \
	audio.usb.default \
	audio_policy.stub

PRODUCT_PACKAGES += \
	libaudiopreprocessing \
	libtinycompress \
	libtinyxml

PRODUCT_PACKAGES += \
	MtkInCallService

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/audio/audio_device.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_device.xml \
	$(DEVICE_PATH)/configs/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
	$(DEVICE_PATH)/configs/audio/audio_em.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_em.xml \
	$(DEVICE_PATH)/configs/audio/audio_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy.conf \
	$(DEVICE_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
	$(DEVICE_PATH)/configs/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
	$(DEVICE_PATH)/configs/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

PRODUCT_COPY_FILES += \
	frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml

# Bluetooth
PRODUCT_PACKAGES += \
	android.hardware.bluetooth@1.0.vendor \
	android.hardware.bluetooth.a2dp@1.0.vendor

# Camera
PRODUCT_PACKAGES += \
	android.hardware.camera.common@1.0.vendor \
	android.hardware.camera.device@1.0.vendor \
	android.hardware.camera.device@3.2.vendor \
	android.hardware.camera.device@3.3.vendor \
	android.hardware.camera.device@3.4.vendor \
	android.hardware.camera.device@3.5.vendor \
	android.hardware.camera.provider@2.4.vendor \
	android.hardware.camera.provider@2.5.vendor

# Display
PRODUCT_PACKAGES += \
	android.hardware.graphics.allocator@2.0-impl \
	android.hardware.graphics.allocator@2.0-service \
	android.hardware.graphics.common@1.2 \
	android.hardware.graphics.composer@2.1-impl \
	android.hardware.graphics.composer@2.1-service \
	android.hardware.graphics.mapper@2.0-impl-2.1 \
	android.hardware.memtrack@1.0-service \
	android.hardware.memtrack@1.0-impl \

PRODUCT_PACKAGES += \
	libvulkan

# DRM
PRODUCT_PACKAGES += \
	android.hardware.drm@1.0.vendor \
	android.hardware.drm@1.1.vendor \
	android.hardware.drm@1.2.vendor \
	android.hardware.drm@1.3.vendor \
	android.hardware.drm@1.3-service.clearkey

# Fingerprint
PRODUCT_PACKAGES += \
	android.hardware.biometrics.fingerprint@2.1-service.RMX1821

# FSTAB
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/rootdir/etc/fstab.mt6771:$(TARGET_COPY_OUT_RAMDISK)/fstab.mt6771

# Gatekeeper
PRODUCT_PACKAGES += \
	android.hardware.gatekeeper@1.0-service \
	android.hardware.gatekeeper@1.0-impl

# GNSS
PRODUCT_PACKAGES += \
	android.hardware.gnss@1.0.vendor \
	android.hardware.gnss@1.1.vendor \
	android.hardware.gnss@2.0.vendor \
	android.hardware.gnss.measurement_corrections@1.0.vendor \
	android.hardware.gnss.visibility_control@1.0.vendor \

PRODUCT_PACKAGES += \
	libcurl \
	libandroid_net

# Health
PRODUCT_PACKAGES += \
	android.hardware.health@2.1-impl \
	android.hardware.health@2.1-impl.recovery \
	android.hardware.health@2.1-service

# HIDL
PRODUCT_PACKAGES += \
	libhidltransport \
	libhidltransport.vendor \
	libhwbinder \
	libhwbinder.vendor \

# Input Configs
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/input/idc/AVRCP.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/AVRCP.idc \
	$(DEVICE_PATH)/configs/input/keylayout/ACCDET.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/ACCDET.kl \
	$(DEVICE_PATH)/configs/input/keylayout/AVRCP.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/AVRCP.kl

# Keymaster
PRODUCT_PACKAGES += \
	android.hardware.keymaster@3.0-impl \
	android.hardware.keymaster@3.0-service

PRODUCT_PACKAGES += \
	libkeymaster3.vendor \
	libkeymaster3support.vendor

# Libxml2
PRODUCT_PACKAGES += \
	libxml2.vendor

# Light
PRODUCT_PACKAGES += \
	android.hardware.light-service.RMX1821

# Media
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
	$(DEVICE_PATH)/configs/media/media_codecs_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_c2.xml \
	$(DEVICE_PATH)/configs/media/media_codecs_ffmpeg.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_ffmpeg.xml \
	$(DEVICE_PATH)/configs/media/media_codecs_mediatek_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_mediatek_audio.xml \
	$(DEVICE_PATH)/configs/media/media_codecs_mediatek_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_mediatek_video.xml \
	$(DEVICE_PATH)/configs/media/media_codecs_oppo.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_oppo.xml \
	$(DEVICE_PATH)/configs/media/media_codecs_oppo_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_oppo_performance.xml \
	$(DEVICE_PATH)/configs/media/media_codecs_oppo_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_oppo_video.xml \
	$(DEVICE_PATH)/configs/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
	$(DEVICE_PATH)/configs/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

PRODUCT_COPY_FILES += \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_le.xml

PRODUCT_PACKAGES += \
	libminijail

# Neural Networks
PRODUCT_PACKAGES += \
	android.hardware.neuralnetworks@1.0.vendor \
	android.hardware.neuralnetworks@1.1.vendor \
	android.hardware.neuralnetworks@1.2.vendor \
	android.hardware.neuralnetworks@1.3.vendor

# Overlays
PRODUCT_PACKAGES += \
	CarrierConfigOverlayRMX1821 \
	DialerOverlayRMX1821 \
	FrameworksResOverlayRMX1821 \
	SettingsProviderOverlayRMX1821 \
	SystemUIOverlayRMX1821 \
	TelephonyOverlayRMX1821 \
	TetheringConfigOverlayRMX1821

# Perf
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/perf/power_whitelist_cfg.xml:$(TARGET_COPY_OUT_VENDOR)/etc/power_whitelist_cfg.xml \
	$(DEVICE_PATH)/configs/perf/powercontable.xml:$(TARGET_COPY_OUT_VENDOR)/etc/powercontable.xml \
	$(DEVICE_PATH)/configs/perf/powerscntbl.xml:$(TARGET_COPY_OUT_VENDOR)/etc/powerscntbl.xml

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
	frameworks/native/data/etc/android.hardware.camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.faketouch.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.faketouch.xml \
	frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
	frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute.xml \
	frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
	frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.software.controls.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.controls.xml \
	frameworks/native/data/etc/android.software.device_id_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_id_attestation.xml \
	frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml \
	frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
	frameworks/native/data/etc/android.software.opengles.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level.xml \
	frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml \
	frameworks/native/data/etc/android.software.vulkan.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml \
	frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/permissions/privapp-permissions-mediatek.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-mediatek.xml

# Power
PRODUCT_PACKAGES += \
	android.hardware.power@1.0.vendor \
	android.hardware.power@1.1.vendor \
	android.hardware.power@1.2.vendor \
	android.hardware.power@1.3.vendor

# Properties
-include $(DEVICE_PATH)/configs/props/vendor_logtag.mk
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

# Public libraries
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

# Radio
PRODUCT_PACKAGES += \
	android.hardware.broadcastradio@1.0.vendor \
	android.hardware.broadcastradio@1.1.vendor \
	android.hardware.radio@1.0.vendor \
	android.hardware.radio@1.1.vendor \
	android.hardware.radio@1.2.vendor \
	android.hardware.radio@1.3.vendor \
	android.hardware.radio@1.4.vendor \
	android.hardware.radio.config@1.0.vendor \
	android.hardware.radio.config@1.1.vendor \
	android.hardware.radio.config@1.2.vendor

# Ramdisk
PRODUCT_PACKAGES += \
	factory_init.connectivity.rc \
	factory_init.project.rc \
	factory_init.rc \
	fstab.mt6771 \
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
	ueventd.mt6771.rc

# RenderScript
PRODUCT_PACKAGES += \
	android.hardware.renderscript@1.0-impl

# RcsService
PRODUCT_PACKAGES += \
	RcsService

# Seccomp Policy
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/seccomp/mediacodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
	$(DEVICE_PATH)/configs/seccomp/mediaextractor.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor.policy \
	$(DEVICE_PATH)/configs/seccomp/mediaswcodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaswcodec.policy

# Secure Element
PRODUCT_PACKAGES += \
	android.hardware.secure_element@1.0.vendor \
	android.hardware.secure_element@1.1.vendor

# Sensors
PRODUCT_PACKAGES += \
	android.hardware.sensors@1.0.vendor \
	android.hardware.sensors@2.0.vendor \
	android.frameworks.sensorservice@1.0.vendor

PRODUCT_PACKAGES += \
	libsensorndkbridge

# Shims
PRODUCT_PACKAGES += \
	libshim_vtservice

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
	$(DEVICE_PATH)

# Soundtrigger
PRODUCT_PACKAGES += \
	android.hardware.soundtrigger@2.2-impl

# Text classifier
PRODUCT_PACKAGES += \
	libtextclassifier_hash.vendor

# Thermal
PRODUCT_PACKAGES += \
	android.hardware.thermal@1.0-impl \
	android.hardware.thermal@1.0-service

# USB
PRODUCT_PACKAGES += \
	android.hardware.usb@1.0.vendor \
	android.hardware.usb@1.1.vendor \
	android.hardware.usb@1.2.vendor \
	android.hardware.usb.gadget@1.0.vendor

# Vibrator
PRODUCT_PACKAGES += \
	android.hardware.vibrator@1.0-impl \
	android.hardware.vibrator@1.0-service

# VNDK
PRODUCT_COPY_FILES += \
	prebuilts/vndk/v29/arm64/arch-arm-armv8-a/shared/vndk-core/libxml2.so:$(TARGET_COPY_OUT_VENDOR)/lib/libxml2-v29.so \
	prebuilts/vndk/v29/arm64/arch-arm-armv8-a/shared/vndk-core/libmedia_helper.so:$(TARGET_COPY_OUT_VENDOR)/lib/libmedia_helper-v29.so \
	prebuilts/vndk/v29/arm64/arch-arm-armv8-a/shared/vndk-sp/libutils.so:$(TARGET_COPY_OUT_VENDOR)/lib/libutils-v29.so \
	prebuilts/vndk/v29/arm64/arch-arm-armv8-a/shared/vndk-sp/libcompiler_rt.so:$(TARGET_COPY_OUT_VENDOR)/lib/libcompiler_rt.so

PRODUCT_COPY_FILES += \
	prebuilts/vndk/v29/arm64/arch-arm64-armv8-a/shared/vndk-sp/libutils.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libutils-v29.so \
	prebuilts/vndk/v29/arm64/arch-arm64-armv8-a/shared/vndk-sp/libcompiler_rt.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libcompiler_rt.so

# WiFi
PRODUCT_PACKAGES += \
	android.hardware.wifi@1.0.vendor \
	android.hardware.wifi@1.1.vendor \
	android.hardware.wifi@1.2.vendor \
	android.hardware.wifi@1.3.vendor \
	android.hardware.wifi.supplicant@1.0.vendor \
	android.hardware.wifi.supplicant@1.1.vendor \
	android.hardware.wifi.supplicant@1.2.vendor \
	android.hardware.wifi.hostapd@1.0.vendor \
	android.hardware.wifi.hostapd@1.1.vendor

PRODUCT_PACKAGES += \
	libkeystore-engine-wifi-hidl \
	libkeystore-wifi-hidl

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
	$(DEVICE_PATH)/configs/wifi/wpa_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant.conf \
	$(DEVICE_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf
