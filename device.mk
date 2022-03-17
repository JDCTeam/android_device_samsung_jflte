#
# Copyright (C) 2013-2016 The CyanogenMod Project
# Copyright (C) 2017-2019 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/samsung/jflte

# Shipping API level
$(call inherit-product, vendor/lineage/build/target/product/product_launched_with_j_mr2.mk)

# Get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/samsung/jf-common/jf-common-vendor-blobs.mk)

# Soong
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_PATH)/overlay

# Always preopt extracted APKs to prevent extracting out of the APK
# for gms modules.
PRODUCT_ALWAYS_PREOPT_EXTRACTED_APK := true

# System Server
PRODUCT_SYSTEM_SERVER_COMPILER_FILTER := speed-profile

# The target has no boot jars to check
SKIP_BOOT_JARS_CHECK := true

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.consumerir.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.sensor.ambient_temperature.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.ambient_temperature.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.relative_humidity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.relative_humidity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/aosp_excluded_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/aosp_excluded_hardware.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml


# AAPT
# Device uses extra-extra-high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# HIDL
PRODUCT_ENFORCE_VINTF_MANIFEST_OVERRIDE := true

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-impl \
    android.hardware.audio@2.0-service \
    android.hardware.audio.effect@2.0-impl \
    audio.a2dp.default \
    audio.primary.msm8960 \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler \
    libqcomvoiceprocessing

# Audio configuration
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(DEVICE_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(DEVICE_PATH)/audio/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml

ifneq ($(findstring jactivelte,$(TARGET_PRODUCT)),)
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/audio/audio_platform_info_jactive.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(DEVICE_PATH)/audio/mixer_paths_jactive.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml
else ifneq ($(findstring jfvelte,$(TARGET_PRODUCT)),)
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(DEVICE_PATH)/audio/mixer_paths_jfvelte.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml
else
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(DEVICE_PATH)/audio/mixer_paths_jflte.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml
endif

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl \
    libbt-vendor

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl.jf \
    camera.device@1.0-impl.jf \
    camera.msm8960 \
    Snap

# ConfigStore
PRODUCT_PACKAGES += \
    disable_configstore
    
# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    copybit.msm8960 \
    gralloc.msm8960 \
    hwcomposer.msm8960 \
    memtrack.msm8960

# Doze
PRODUCT_PACKAGES += \
    SamsungDoze

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.0-service

# VNDK
PRODUCT_COPY_FILES += \
    prebuilts/vndk/v29/arm/arch-arm-armv7-a-neon/shared/vndk-core/libprotobuf-cpp-lite.so:$(TARGET_COPY_OUT_VENDOR)/lib/libprotobuf-cpp-lite-v29.so

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Filesystem tools
PRODUCT_PACKAGES += \
    resize2fs_static

ifeq ($(findstring jactivelte,$(TARGET_PRODUCT)),)
# FlipFlap
PRODUCT_PACKAGES += \
    FlipFlap
endif

# GPS
PRODUCT_PACKAGES += \
    android.hardware.gnss@1.0-impl.legacy \
    android.hardware.gnss@1.0-service.legacy \
    gps.conf \
    gps.msm8960 \
    sap.conf

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config

# IR
PRODUCT_PACKAGES += \
    android.hardware.ir@1.0-service.samsung

# Keylayouts
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl \
    $(DEVICE_PATH)/keylayout/sec_touchkey.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/sec_touchkey.kl

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-service.software

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.samsung

# Loki
PRODUCT_PACKAGES += \
    loki_tool \
    loki.sh \
    loki_bootloaders \
    recovery-transform.sh
    
# LiveDisplay
PRODUCT_PACKAGES += \
    vendor.lineage.livedisplay@2.0-service.jf

# Media
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_le.xml \
    $(DEVICE_PATH)/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(DEVICE_PATH)/media/media_codecs_google_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_performance.xml \
    $(DEVICE_PATH)/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(DEVICE_PATH)/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

# NFC packages
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.0-impl \
    android.hardware.nfc@1.0-service \
    nfc_nci.msm8960 \
    NfcNci \
    Tag

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/libnfc-nci.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci.conf

# OMX
PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libmm-omxcore \
    libOmxCore \
    libOmxVdec \
    libOmxVenc \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libstagefrighthw

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.1-service.jf

# Ramdisk
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/fstab.qcom:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.qcom \
    $(DEVICE_PATH)/rootdir/fstab.ramdisk:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom \
    $(DEVICE_PATH)/rootdir/init.qcom.power.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.qcom.power.rc \
    $(DEVICE_PATH)/rootdir/init.qcom.power.rc:recovery/root/init.recovery.qcom.rc \
    $(DEVICE_PATH)/rootdir/init.qcom.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.qcom.rc \
    $(DEVICE_PATH)/rootdir/init.qcom.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.qcom.usb.rc \
    $(DEVICE_PATH)/rootdir/init.safailnet.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.safailnet.rc \
    $(DEVICE_PATH)/rootdir/ueventd.qcom.rc:$(TARGET_COPY_OUT_VENDOR)/ueventd.rc

# Kernel Modules
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/init.insmod.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.insmod.sh \
    $(DEVICE_PATH)/configs/init.insmod.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/init.insmod.cfg

# Health HAL
PRODUCT_PACKAGES += \
    android.hardware.health@2.0-service.jf

# RenderScript
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl

# Seccomp Policy
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/seccomp_policy/mediacodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl.jf \
    android.hardware.sensors@1.0-service.jf

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/_hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/_hals.conf

# System Properties
$(call inherit-product, $(DEVICE_PATH)/system_prop.mk)

# Thermal
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/thermal-engine-8064ab.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine-8064ab.conf

# Trust
PRODUCT_PACKAGES += \
    vendor.lineage.trust@1.0-service

ifeq ($(findstring jactivelte,$(TARGET_PRODUCT)),)
# Touch
PRODUCT_PACKAGES += \
    vendor.lineage.touch@1.0-service.jf
endif

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.jf

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-service.jf

# Wifi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service.legacy \
    macloader \
    hostapd \
    libwpa_client \
    wificond \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/nvram_net.txt:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/nvram_net.txt \
    $(DEVICE_PATH)/configs/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(DEVICE_PATH)/configs/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf

# Do not spin up a separate process for the network stack, use an in-process APK.
PRODUCT_PACKAGES += InProcessNetworkStack
PRODUCT_PACKAGES += com.android.tethering.inprocess

# Common Qualcomm
$(call inherit-product, device/samsung/qcom-common/qcom-common.mk)
