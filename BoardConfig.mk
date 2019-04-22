# Copyright (C) 2013-2016, The CyanogenMod Project
# Copyright (C) 2017, The LineageOS Project
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

DEVICE_PATH := device/samsung/jflte

# Inherit from proprietary vendor
-include vendor/samsung/jf-common/BoardConfigVendor.mk

# inherit from qcom-common
-include device/samsung/qcom-common/BoardConfigCommon.mk

# Includes
TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

# The first api level the device has commercially launched on
PRODUCT_SHIPPING_API_LEVEL := 17

# HIDL
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/compatibility_matrix.xml

# Set default locale
PRODUCT_LOCALES := en-GB

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Platform
TARGET_BOARD_PLATFORM := msm8960
TARGET_CPU_VARIANT := krait

#Qcom hw
BOARD_USES_QCOM_HARDWARE := true

# Binder
TARGET_USES_64_BIT_BINDER := true

# Kernel
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom androidboot.memcg=true user_debug=22 msm_rtb.filter=0x3F ehci-hcd.park=3 androidboot.bootdevice=msm_sdcc.1
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x80200000
BOARD_KERNEL_IMAGE_NAME := zImage
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_BOOTIMG_MK := hardware/samsung/mkbootimg.mk
TARGET_KERNEL_SOURCE := kernel/samsung/jf
TARGET_KERNEL_CONFIG := buff_jf_defconfig

# Toolchain
KERNEL_TOOLCHAIN := $(shell pwd)/prebuilts/gcc/linux-x86/arm/arm-linux-7.1.x-gnueabi/bin
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-Samsung-linux-gnueabi-

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8960

# Recovery
LZMA_RAMDISK_TARGETS := recovery
TARGET_RECOVERY_DENSITY := hdpi
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/fstab.qcom

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1181114368
BOARD_SYSTEMIMAGE_JOURNAL_SIZE := 0
BOARD_USERDATAIMAGE_PARTITION_SIZE := 28551290624
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 2170552320
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USES_MKE2FS := true
# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)/releasetools

# Audio
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := true
AUDIO_FEATURE_ENABLED_FLUENCE := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
AUDIO_FEATURE_ENABLED_NEW_SAMPLE_RATE := true
BOARD_USES_ALSA_AUDIO := true
BOARD_HAVE_SAMSUNG_CSDCLIENT := true
USE_CUSTOM_AUDIO_POLICY := 1
TARGET_USE_OLD_SOUND_PICKER := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth
BOARD_CUSTOM_BT_CONFIG := $(DEVICE_PATH)/bluetooth/vnd_jf.txt
BOARD_HAVE_BLUETOOTH_BCM := true

# Legacy blobs
TARGET_PROCESS_SDK_VERSION_OVERRIDE := \
    /system/bin/mediaserver=22 \
    /system/vendor/bin/mm-qcamera-daemon=22 \
    /system/vendor/bin/hw/android.hardware.sensors@1.0-service.jf=22 \
    /system/vendor/bin/hw/rild=22 \
    /system/vendor/bin/hw/android.hardware.bluetooth@1.0-service=22

# Camera
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
TARGET_PROVIDES_CAMERA_HAL := true
TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY := camera_parameters_samsung_msm8960
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_NEED_SAMSUNG_CAMERA_MODE := true
TARGET_NEED_CAMERA_ZSL := true
TARGET_DISPLAY_INSECURE_MM_HEAP := true

# Enable dexpreopt to speed boot time
WITH_DEXPREOPT := true
WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := false
WITH_DEXPREOPT_DEBUG_INFO := false
USE_DEX2OAT_DEBUG := false
DONT_DEXPREOPT_PREBUILTS := true

# Display
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS := 0x02000000U
ARCH_ARM_HAVE_NEON := true
USE_OPENGL_RENDERER := true
TARGET_USES_ION := true


# Adreno configuration
BOARD_EGL_CFG := $(DEVICE_PATH)/configs/egl.cfg


# Renderscript
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET := true
TARGET_NO_RPC := true

# Allow suspend in charge mode
BOARD_CHARGER_ENABLE_SUSPEND := true

# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024

# RIL
BOARD_PROVIDES_LIBRIL := true
TARGET_RIL_VARIANT := caf

# Power
TARGET_HAS_NO_POWER_STATS := true
TARGET_HAS_NO_WLAN_STATS := true

# LineageHW
JAVA_SOURCE_OVERLAYS := org.lineageos.hardware|$(DEVICE_PATH)/lineagehw|**/*.java

# Vendor init
TARGET_INIT_VENDOR_LIB := libinit_jflte
TARGET_RECOVERY_DEVICE_MODULES := libinit_jflte

# Exclude serif fonts for saving system.img size.
EXCLUDE_SERIF_FONTS := true

# Don't try to build and run all tests by default. Several tests have
# dependencies on the framework.
ANDROID_NO_TEST_CHECK := true

# Speed profile services and wifi-service to reduce RAM and storage.
PRODUCT_SYSTEM_SERVER_COMPILER_FILTER := speed-profile

# Always preopt extracted APKs to prevent extracting out of the APK
# for gms modules.
PRODUCT_ALWAYS_PREOPT_EXTRACTED_APK := true
PRODUCT_USE_PROFILE_FOR_BOOT_IMAGE := true
PRODUCT_DEX_PREOPT_BOOT_IMAGE_PROFILE_LOCATION := frameworks/base/config/boot-image-profile.txt
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false
PRODUCT_DEXPREOPT_SPEED_APPS += SystemUI

# Compile libhwui in performance mode
HWUI_COMPILE_FOR_PERF := true

# Wifi module
BOARD_HAVE_SAMSUNG_WIFI := true
BOARD_WLAN_DEVICE := bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_${BOARD_WLAN_DEVICE}
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_${BOARD_WLAN_DEVICE}
WPA_SUPPLICANT_VERSION := VER_0_8_X
WIFI_BAND := 802_11_ABG
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_AP := "/vendor/etc/wifi/bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_STA := "/vendor/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_OPERSTATE_PATH := "/sys/class/net/wlan0/operstate"

# Include SE policies
#include device/qcom/sepolicy/sepolicy.mk
#include device/qcom/sepolicy/legacy-sepolicy.mk
#BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy

# Misc
ALLOW_MISSING_DEPENDENCIES := true
