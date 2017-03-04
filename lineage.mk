$(call inherit-product, device/samsung/jfltetmo/full_jfltetmo.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_BUILD_PROP_OVERRIDES += \
  PRODUCT_NAME=jfltetmo \
  TARGET_DEVICE=jfltetmo \
  BUILD_FINGERPRINT="samsung/jfltetmo/jfltetmo:4.4.4/KTU84P/M919UVSFQA1:user/release-keys" \
  PRIVATE_BUILD_DESC="jfltetmo-user 4.4.4 KTU84P M919UVSFQA1 release-keys"

PRODUCT_NAME := lineage_jfltetmo
PRODUCT_DEVICE := jfltetmo

