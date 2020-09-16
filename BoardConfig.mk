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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# Inherit from qcom-common
-include device/samsung/qcom-common/BoardConfigCommon.mk

# Inherit from proprietary vendor
-include vendor/samsung/jf-common/BoardConfigVendor.mk

DEVICE_PATH := device/samsung/jflte

# Platform
TARGET_BOARD_PLATFORM := msm8960

# Architecture
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := krait

# Binder
TARGET_USES_64_BIT_BINDER := true

# LMKD stats logging
TARGET_LMKD_STATS_LOG := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8960

# Kernel
BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_BOOTIMG_MK := hardware/samsung/mkbootimg.mk
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3 androidboot.bootdevice=msm_sdcc.1
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x80200000
BOARD_KERNEL_IMAGE_NAME := zImage
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000
LZMA_RAMDISK_TARGETS := recovery
TARGET_KERNEL_CONFIG := jdc_jf_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/jf
TARGET_KERNEL_VARIANT_CONFIG := jf_eur_defconfig

# Toolchain
KERNEL_TOOLCHAIN := $(shell pwd)/prebuilts/gcc/linux-x86/arm/arm-linux-7.1.x-gnueabi/bin
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-Samsung-linux-gnueabi-

# Audio
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := true
AUDIO_FEATURE_ENABLED_FLUENCE := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
BOARD_FUSION3_PLATFORM := true
BOARD_HAVE_SAMSUNG_CSDCLIENT := true
BOARD_USES_ALSA_AUDIO := true
USE_CUSTOM_AUDIO_POLICY := 1
USE_XML_AUDIO_POLICY_CONF := 1

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth
ifneq ($(findstring jfvelte,$(TARGET_PRODUCT)),)
BOARD_HAVE_BLUETOOTH_QCOM := true
else
BOARD_CUSTOM_BT_CONFIG := $(DEVICE_PATH)/bluetooth/vnd_jf.txt
BOARD_HAVE_BLUETOOTH_BCM := true
endif

# Camera
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
TARGET_NEED_CAMERA_ZSL := true
TARGET_NEED_DISABLE_FACE_DETECTION := true
TARGET_NEED_DISABLE_FACE_DETECTION_BOTH_CAMERAS := true
TARGET_PROVIDES_CAMERA_HAL := true
TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY := //$(DEVICE_PATH):camera_parameters_samsung_msm8960
USE_DEVICE_SPECIFIC_CAMERA := true

TARGET_PROCESS_SDK_VERSION_OVERRIDE += \
    /system/bin/mediaserver=22 \
    /system/vendor/bin/mm-qcamera-daemon=22

# Checks
ANDROID_NO_TEST_CHECK := true

# Dex
WITH_DEXPREOPT := true
WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := false

# Display
TARGET_SCREEN_DENSITY := 480
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS := 0x2000U | 0x02000000U

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true

# Fonts
EXCLUDE_SERIF_FONTS := true

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET := true
TARGET_NO_RPC := true

# Includes
TARGET_SPECIFIC_HEADER_PATH += $(DEVICE_PATH)/include

# Manifests
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/vendor_interface/manifest.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/vendor_interface/compatibility_matrix.xml

# DexPreopt debug info
WITH_DEXPREOPT_DEBUG_INFO := false

# Legacy
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true

# Filesystem
BOARD_ROOT_EXTRA_FOLDERS := efs firmware firmware-mdm
BOARD_ROOT_EXTRA_SYMLINKS := /data/tombstones:/tombstones
TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/config.fs

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 2170552320
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16000000
# Set to jgedlte value to maintain compatibility
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_JOURNAL_SIZE := 0
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2894069760
BOARD_USERDATAIMAGE_PARTITION_SIZE := 9961472000
BOARD_FLASH_BLOCK_SIZE := 131072

# Recovery
TARGET_RECOVERY_DENSITY := xhdpi
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/fstab.qcom
TARGET_RECOVERY_SKIP_EV_REL_INPUT := true
TARGET_USERIMAGES_USE_EXT4 := true

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)/releasetools

# Renderscript
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

# SELinux
include device/qcom/sepolicy-legacy/sepolicy.mk
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/common
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += $(DEVICE_PATH)/sepolicy/private

# Sensors
TARGET_PROCESS_SDK_VERSION_OVERRIDE += \
    /system/vendor/bin/hw/android.hardware.sensors@1.0-service.jf=22

# Vendor Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_jflte
TARGET_RECOVERY_DEVICE_MODULES := libinit_jflte

# Wifi module
ifneq ($(findstring jfvelte,$(TARGET_PRODUCT)),)
BOARD_WLAN_DEVICE := qcwcn
BOARD_HAS_QCOM_WLAN := true
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
TARGET_PROVIDES_WCNSS_QMI := true
TARGET_USES_QCOM_WCNSS_QMI := true
WPA_SUPPLICANT_VERSION := VER_0_8_X
WIFI_DRIVER_MODULE_PATH := "/vendor/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME := "wlan"
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP := "ap"
else
BOARD_WLAN_DEVICE := bcmdhd
BOARD_HAVE_SAMSUNG_WIFI := true
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_${BOARD_WLAN_DEVICE}
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_${BOARD_WLAN_DEVICE}
WPA_SUPPLICANT_VERSION := VER_0_8_X
WIFI_BAND := 802_11_ABG
WIFI_DRIVER_FW_PATH_AP := "/vendor/etc/wifi/bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA := "/vendor/etc/wifi/bcmdhd_sta.bin"
endif

# TWRP (optional)
ifeq ($(WITH_TWRP),true)
-include $(DEVICE_PATH)/twrp.mk
endif
