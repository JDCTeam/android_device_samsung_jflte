# Copyright (C) 2013-2016, The CyanogenMod Project
# Copyright (C) 2019, JDCTeam
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

# Assert
TARGET_OTA_ASSERT_DEVICE := jflte,jfltexx,i9505,GT-I9505,jgedlte,i9505g,GT-I9505G,9505G,i9505G,GT-9505G,9507,GT-9507,i9507,jfltevzw,jfltespr,jflterefreshspr,jfltetmo,jfltecri,jfltecsp,jflteatt,jfltecan,jfltetfnatt,jfltetfntmo,jflteusc,jfltezm

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from jflte
$(call inherit-product, device/samsung/jflte/device.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit some JDCTeam stuff.
$(call inherit-product, vendor/jdc/config/common.mk)

PRODUCT_NAME := lineage_jflte
PRODUCT_DEVICE := jflte
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := Samsung
PRODUCT_MODEL := GT-I9505

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=jfltexx \
    TARGET_DEVICE=jfltexx \
    PRIVATE_BUILD_DESC="jfltexx-user 5.0.1 LRX22C I9505XXUHQK1 release-keys"

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := samsung/jfltexx/jflte:5.0.1/LRX22C/I9505XXUHQK1:user/release-keys
