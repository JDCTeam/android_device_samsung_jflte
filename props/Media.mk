# Media
PRODUCT_PROPERTY_OVERRIDES += \
    audio.offload.disable=1 \
    persist.vendor.audio.fluence.speaker=true \
    persist.vendor.audio.fluence.voicecall=true \
    ro.vendor.audio.sdk.fluencetype=fluence \
    vendor.dedicated.device.for.voip=true \
    vendor.voice.path.for.pcm.voip=true \
    debug.stagefright.ccodec=0

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    camera2.portability.force_api=1 \
    media.stagefright.legacyencoder=true \
	media.stagefright.less-secure=true

# Volume
PRODUCT_PROPERTY_OVERRIDES += \
	ro.config.media_vol_steps=45
