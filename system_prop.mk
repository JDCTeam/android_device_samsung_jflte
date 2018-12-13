# ART
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.dex2oat-swap=false

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bluetooth.dun=true \
    ro.bluetooth.sap=true \
    ro.bluetooth.hfp.ver=1.6 \
	ro.bt.bdaddr_path=/efs/bluetooth/bt_addr

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
	camera2.portability.force_api=1

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    debug.composition.type=c2d \
    debug.hwui.use_buffer_age=false \
    persist.debug.wfd.enable=1 \
    debug.sf.disable_hwcomposer=1 \
    persist.sys.wfd.virtual=0 \
    ro.sf.lcd_density=420 \
    ro.opengles.version=196608 \
    ro.qualcomm.cabl=0 \
    persist.hwc.mdpcomp.enable = true \
	ro.hwui.text_large_cache_height=2048

# GPS
PRODUCT_PROPERTY_OVERRIDES += \
	ro.gps.agps_provider=1 \
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

# Perf
PRODUCT_PROPERTY_OVERRIDES += \
	ro.vendor.extension_library=libqti-perfd-client.so

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/vendor/lib/libril-qc-qmi-1.so \
    ro.com.android.mobiledata=false \
    persist.radio.add_power_save=1 \
    persist.radio.apm_sim_not_pwdn=1 \
	persist.radio.no_wait_for_card=1

# WiFi
PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0 \
	wifi.direct.interface=p2p0

# Vendor security patch level
PRODUCT_PROPERTY_OVERRIDES += \
	ro.lineage.build.vendor_security_patch=2017-08-01
