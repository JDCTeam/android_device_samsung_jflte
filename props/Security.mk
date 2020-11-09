# Vendor security patch level
PRODUCT_PROPERTY_OVERRIDES += \
    ro.lineage.build.vendor_security_patch=2017-08-01

# Debug
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 \
    ro.debuggable=1 \
    persist.service.adb.enable=1 \
    persist.sys.usb.config=adb \
    service.adb.root=1

PRODUCT_PROPERTY_OVERRIDES += \
    ro.fastbootd.available=true

# Recovery
PRODUCT_PROPERTY_OVERRIDES += \
    ro.recovery.skip_ev_rel_input=true
