# Media
PRODUCT_PROPERTY_OVERRIDES += \
    audio.offload.disable=1 \
    persist.vendor.audio.fluence.speaker=true \
    persist.vendor.audio.fluence.voicecall=true \
    ro.vendor.audio.sdk.fluencetype=fluence \
    vendor.dedicated.device.for.voip=true \
    vendor.voice.path.for.pcm.voip=true \
    debug.stagefright.ccodec=0

# Volume
PRODUCT_PROPERTY_OVERRIDES += \
	ro.config.media_vol_steps=45
