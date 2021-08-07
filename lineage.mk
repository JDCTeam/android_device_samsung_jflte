$(call inherit-product, device/samsung/jflte/full_jflte.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_BUILD_PROP_OVERRIDES += \
  PRODUCT_NAME=jflte \
  TARGET_DEVICE=jflte \
  BUILD_FINGERPRINT="samsung/jfltexx/jflte:5.0.1/LRX22C/I9505XXUHQK1:user/release-keys" \
  PRIVATE_BUILD_DESC="jfltexx-user 5.0.1 LRX22C I9505XXUHQK1 release-keys"

PRODUCT_NAME := lineage_jflte
PRODUCT_DEVICE := jflte

