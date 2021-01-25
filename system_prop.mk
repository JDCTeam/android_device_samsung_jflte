# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bt.bdaddr_path=/efs/bluetooth/bt_addr

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    camera2.portability.force_api=1

# Dalvik
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-swap=false

# fastbootd
PRODUCT_PROPERTY_OVERRIDES += \
    ro.fastbootd.available=true

# GPS
PRODUCT_PROPERTY_OVERRIDES += \
    persist.gps.qc_nlp_in_use=1 \
    ro.gps.agps_provider=1

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
	debug.composition.type=c2d \
	debug.hwui.use_buffer_age=false \
	debug.sf.enable_gl_backpressure=1 \
	debug.sf.latch_unsignaled=1 \
 	ro.opengles.version=196608 \
  	ro.sf.lcd_density=480 \
    ro.hwui.text_large_cache_height=2048

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    audio.offload.disable=1 \
    debug.stagefright.ccodec=0 \
    persist.vendor.audio.fluence.speaker=true \
    persist.vendor.audio.fluence.voicecall=true \
    ro.vendor.audio.sdk.fluencetype=fluence \
    vendor.dedicated.device.for.voip=true \
    vendor.voice.path.for.pcm.voip=true

# Qualcomm Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=libqti-perfd-client.so

# Recovery
PRODUCT_PROPERTY_OVERRIDES += \
    ro.recovery.skip_ev_rel_input=true

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/vendor/lib/libril-qc-qmi-1.so \
    ro.com.android.mobiledata=false \
    persist.radio.add_power_save=1 \
    persist.radio.apm_sim_not_pwdn=1 \
    persist.radio.no_wait_for_card=1

# Wifi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0

# Charger
PRODUCT_PRODUCT_PROPERTIES += \
    ro.charger.enable_suspend=true

# Dalvik
PRODUCT_PRODUCT_PROPERTIES += \
	dalvik.vm.heapstartsize=8m \
    dalvik.vm.heapgrowthlimit=256m \
    dalvik.vm.heapsize=768m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=2m \
    dalvik.vm.heapmaxfree=8m

##### Optlos

# UI tests
PRODUCT_PROPERTY_OVERRIDES += \
	windowsmgr.max_events_per_sec=150 \
	ro.min_pointer_dur=8 ro.max.fling_velocity=12000 \
	ro.min.fling_velocity=8000 \
	sys.use_fifo_ui=1

# Volume
PRODUCT_PROPERTY_OVERRIDES += \
	ro.config.media_vol_steps=45

# unified RIL
PRODUCT_PROPERTY_OVERRIDES += \
	persist.data.netmgrd.qos.enable=false \
    persist.qcril.disable_retry=true \
    persist.telephony.oosisdc=false \
    ro.use_data_netmgrd=true \
    ril.subscription.types=NV,RUIM

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

# tmp
# Dex
# PRODUCT_PROPERTY_OVERRIDES += \
#     pm.dexopt.install=quicken \
#     dalvik.vm.dex2oat-filter=quicken \
#     dalvik.vm.image-dex2oat-threads=4 \
#     dalvik.vm.image-dex2oat-filter=quicken \
#     dalvik.vm.usejitprofiles=false \
#     pm.dexopt.bg-dexopt=speed-profile \
#     pm.dexopt.ab-ota=speed