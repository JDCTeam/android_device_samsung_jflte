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

# Charger
PRODUCT_PROPERTY_OVERRIDES += \
	ro.enable_boot_charger_mode=1

# Display
PRODUCT_PROPERTY_OVERRIDES += \
	debug.hwui.use_buffer_age=false \
	debug.composition.type=c2d \
	ro.opengles.version=196608 \
	ro.sf.lcd_density=480

# GPS
PRODUCT_PROPERTY_OVERRIDES += \
	ro.gps.agps_provider=1 \
	ro.qc.sdk.izat.premium_enabled=0 \
	ro.qc.sdk.izat.service_mask=0x0 \
	persist.gps.qc_nlp_in_use=0

# Media
PRODUCT_PROPERTY_OVERRIDES += \
	mm.enable.smoothstreaming=true

# NFC
PRODUCT_PROPERTY_OVERRIDES += \
	ro.nfc.port=I2C

# OMX properties
PRODUCT_PROPERTY_OVERRIDES += \
	persist.media.treble_omx=false

# Perf
PRODUCT_PROPERTY_OVERRIDES += \
	ro.vendor.extension_library=libqti-perfd-client.so

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
	persist.data.ds_fmc_app.mode=0 \
	persist.data_netmgrd_nint=16 \
	persist.data.qmi.adb_logmask=0 \
	persist.omh.enabled=1 \
	persist.radio.add_power_save=1 \
	persist.radio.apm_sim_not_pwdn=1 \
	persist.radio.fill_eons=1 \
	persist.radio.use_se_table_only=1 \
	ro.telephony.mms_data_profile=5 \
	ro.telephony.ril_class=jflteRIL

# Time
PRODUCT_PROPERTY_OVERRIDES += \
	persist.timed.enable=true

# Timeout failed shutdowns
PRODUCT_PROPERTY_OVERRIDES += \
	ro.build.shutdown_timeout=5

# WiFi
PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0
