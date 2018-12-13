# ART
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.dex2oat-swap=false

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
	audio.offload.disable=1 \
	persist.audio.fluence.speaker=true \
	persist.audio.fluence.voicecall=true \
	qcom.hw.aac.encoder=true \
	ro.qc.sdk.audio.fluencetype=fluence \
	use.dedicated.device.for.voip=true \
	use.voice.path.for.pcm.voip=false \

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
	ro.bt.bdaddr_path=/efs/bluetooth/bt_addr

# Display
PRODUCT_PROPERTY_OVERRIDES += \
	debug.hwui.use_buffer_age=false \
	debug.composition.type=c2d \
	ro.opengles.version=196608 \
	ro.sf.lcd_density=480

# GPS
PRODUCT_PROPERTY_OVERRIDES += \
	ro.gps.agps_provider=1 \
	persist.gps.qc_nlp_in_use=0

# Media
PRODUCT_PROPERTY_OVERRIDES += \
	mm.enable.smoothstreaming=true

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
	wifi.interface=wlan0
