# QC Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=libqti-perfd-client.so

# Dex
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-swap=false \
    pm.dexopt.install=quicken \
    dalvik.vm.dex2oat-swap=false \
    dalvik.vm.dex2oat-filter=quicken \
    dalvik.vm.image-dex2oat-threads=4 \
    dalvik.vm.image-dex2oat-filter=quicken \
    dalvik.vm.heapstartsize=16m \
    dalvik.vm.heapgrowthlimit=256m \
    dalvik.vm.heapsize=512m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=4m \
    dalvik.vm.heapmaxfree=8m \
    dalvik.vm.usejitprofiles=false \
    pm.dexopt.bg-dexopt=speed \
    pm.dexopt.ab-ota=speed

# Charger
PRODUCT_PRODUCT_PROPERTIES += \
    ro.charger.enable_suspend=true
