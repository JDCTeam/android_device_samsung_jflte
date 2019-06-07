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

$(call inherit-product, $(SRC_TARGET_DIR)/product/core.mk)

# Get the prebuilt list of APNs
$(call inherit-product, vendor/omni/config/gsm.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Enhanced NFC
#$(call inherit-product, vendor/gzosp/config/nfc_enhanced.mk)

# must be before including omni part
TARGET_BOOTANIMATION_SIZE := 1080p

# Inherit some Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from jflte device
$(call inherit-product, $(LOCAL_PATH)/device.mk)


# Boot animation
TARGET_SCREEN_WIDTH := 1080
TARGET_SCREEN_HEIGHT := 1920

# CarrierConfig
PRODUCT_PACKAGE_OVERLAYS += vendor/omni/overlay/CarrierConfig

PRODUCT_NAME := omni_jflte
PRODUCT_DEVICE := jflte
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := Samsung

PRODUCT_BUILD_PROP_OVERRIDES += \
    DEVICE_MAINTAINERS="Buff99 & JDCTeam"
