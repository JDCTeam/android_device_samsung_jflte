# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/vendor/lib/libril-qc-qmi-1.so \
    ro.com.android.mobiledata=false \
    persist.radio.add_power_save=1 \
    persist.radio.apm_sim_not_pwdn=1

# Dex
PRODUCT_PROPERTY_OVERRIDES += \
    pm.dexopt.first-boot=quicken \
    pm.dexopt.boot=verify \
    pm.dexopt.install=quicken \
    pm.dexopt.nsys-library=quicken \
    pm.dexopt.shared-apk=quicken \
    pm.dexopt.forced-dexopt=quicken \
    pm.dexopt.core-app=quicken \
    dalvik.vm.image-dex2oat-Xms=64m \
    dalvik.vm.image-dex2oat-Xmx=64m \
    dalvik.vm.dex2oat-Xms=64m \
    dalvik.vm.dex2oat-Xmx=512m \
    dalvik.vm.dex2oat-swap=false \
    dalvik.vm.dex2oat-filter=quicken \
    dalvik.vm.image-dex2oat-threads=4 \
    dalvik.vm.usejit=true \
    dalvik.vm.usejitprofiles=true \
    dalvik.vm.execution-mode=int:fast \
    dalvik.vm.appimageformat=lz4 \
    dalvik.vm.image-dex2oat-filter=quicken \
    dalvik.vm.heapstartsize=16m \
    dalvik.vm.heapgrowthlimit=256m \
    dalvik.vm.heapsize=512m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=4m \
    dalvik.vm.heapmaxfree=8m \
    debug.atrace.tags.enableflags=0 \
    ro.dalvik.vm.native.bridge=0 \
    ro.kernel.android.checkjni=0 \
    ro.kernel.checkjni=0
    
# GPS
PRODUCT_PROPERTY_OVERRIDES += \
    persist.gps.qc_nlp_in_use=1

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    audio.offload.disable=1 \
    media.aac_51_output_enabled=true \
    mm.enable.smoothstreaming=true \
    persist.vendor.audio.fluence.speaker=true \
    persist.vendor.audio.fluence.voicecall=true \
    ro.vendor.audio.sdk.fluencetype=fluence \
    vendor.dedicated.device.for.voip=true \
    vendor.voice.path.for.pcm.voip=false

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    debug.composition.type=c2d \
    debug.hwui.use_buffer_age=false \
    persist.debug.wfd.enable=1 \
    persist.sys.wfd.virtual=0 \
    ro.sf.lcd_density=420 \
    ro.opengles.version=196608 \
    ro.qualcomm.cabl=0 \
    ro.hwui.text_large_cache_height=2048

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    camera2.portability.force_api=1

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bluetooth.dun=true \
    ro.bluetooth.sap=true \
    ro.bluetooth.hfp.ver=1.6 \
    ro.bt.bdaddr_path=/efs/bluetooth/bt_addr

# Wifi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0

# QC Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=libqti-perfd-client.so

# Dalvik
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-swap=false \
    ro.am.reschedule_service=true

# Vendor security patch level
PRODUCT_PROPERTY_OVERRIDES += \
    ro.lineage.build.vendor_security_patch=2017-08-01
