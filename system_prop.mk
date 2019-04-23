# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/vendor/lib/libril-qc-qmi-1.so \
    ro.com.android.mobiledata=false \
    persist.radio.add_power_save=1 \
    persist.radio.apm_sim_not_pwdn=1 \
    persist.radio.no_wait_for_card=1 \
    persist.data.netmgrd.qos.enable=false \
    persist.qcril.disable_retry=true \
    ro.use_data_netmgrd=true \
    persist.telephony.oosisdc=false \
    ril.subscription.types=NV,RUIM


# Dex
PRODUCT_PROPERTY_OVERRIDES += \
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
	dalvik.vm.heapmaxfree=8m

# GPS
PRODUCT_PROPERTY_OVERRIDES += \
    persist.gps.qc_nlp_in_use=1 \
    ro.gps.agps_provider=1

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
    ro.sf.lcd_density=430 \
    ro.opengles.version=196608 \
    ro.qualcomm.cabl=0 \
    ro.hwui.texture_cache_size=50 \
	ro.hwui.layer_cache_size=34 \
	ro.hwui.path_cache_size=10 \
	ro.hwui.shape_cache_size=4 \
	ro.hwui.gradient_cache_size=2 \
	ro.hwui.drop_shadow_cache_size=6 \
	ro.hwui.text_small_cache_width=2048 \
	ro.hwui.text_small_cache_height=2048 \
	ro.hwui.text_large_cache_width=4096 \
	ro.hwui.text_large_cache_height=4096 \
	debug.hwui.renderer=opengl \
	persist.hwc.mdpcomp.enable=true \
	debug.cpurend.vsync=false \
	debug.sf.latch_unsignaled=1 \
	debug.sf.disable_backpressure=1 \
	debug.sf.recomputecrop=0 \
	persist.graphics.vulkan.disable=true \
	debug.sf.hw=1 \
	debug.egl.hw=1

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    camera2.portability.force_api=1 \
    media.stagefright.legacyencoder=true \
	media.stagefright.less-secure=true

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bluetooth.dun=true \
    persist.sys.dun.override=0 \
    ro.bluetooth.sap=true \
    ro.bluetooth.hfp.ver=1.6 \
    bluetooth.chip.vendor=brcm \
    persist.service.bdroid.a2dp_con=0 \
	persist.service.bdroid.scms_t=0 \
    ro.bt.bdaddr_path=/efs/bluetooth/bt_addr \
    persist.bt.enableAptXHD=true

# Wifi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.direct.interface=p2p0

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

# Aroma validation
PRODUCT_PROPERTY_OVERRIDES += \
	persist.vendor.romname=buffromsjdc

# Memory optimizations
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.qti.am.reschedule_service=true \
    ro.vendor.qti.sys.fw.bservice_enable=true

# UI Threads
PRODUCT_PROPERTY_OVERRIDES += \
	sys.use_fifo_ui=1
