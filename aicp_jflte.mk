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

# Inherit some AospExtended stuff.
$(call inherit-product, vendor/aicp/config/common_full_phone.mk)

# Boot animation res
TARGET_BOOT_ANIMATION_RES := 1080

PRODUCT_NAME := aicp_jflte
PRODUCT_DEVICE := jflte
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := Samsung
PRODUCT_RELEASE_NAME := jflte

PRODUCT_BUILD_PROP_OVERRIDES += \
    DEVICE_MAINTAINERS="Buff99 & JDCTeam"
