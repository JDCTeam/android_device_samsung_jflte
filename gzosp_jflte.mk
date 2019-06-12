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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from jflte device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

# Enhanced NFC
#$(call inherit-product, vendor/gzosp/config/nfc_enhanced.mk)

# Inherit some Gzosp stuff.
$(call inherit-product, vendor/gzosp/config/common_full_phone.mk)

# Boot animation res
TARGET_SCREEN_WIDTH := 1080
TARGET_SCREEN_HEIGHT := 1920
TARGET_BOOT_ANIMATION_RES := 1080

PRODUCT_NAME := gzosp_jflte
PRODUCT_DEVICE := jflte
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := Samsung

PRODUCT_ENFORCE_RRO_TARGETS := \
    framework-res

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="blueline-user 9 PQ2A.190405.003 5310204 release-keys"

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := google/blueline/blueline:9/PQ2A.190405.003/5310204:user/release-keys
VENDOR_BUILD_FINGERPRINT := google/blueline/blueline:9/PQ2A.190405.003/5310204:user/release-keys

PRODUCT_SYSTEM_PROPERTY_BLACKLIST := ro.product.model

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME="GT-I9505"

PRODUCT_BUILD_PROP_OVERRIDES += \
    DEVICE_MAINTAINERS="Buff99 & JDCTeam"
