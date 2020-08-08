# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=480 \
    ro.opengles.version=196608 \
	debug.composition.type=c2d \
    debug.hwui.use_buffer_age=false \
    debug.sf.enable_gl_backpressure=1 \
    ro.hwui.text_large_cache_height=2048

# Experimental
#PRODUCT_PROPERTY_OVERRIDES += \
#	ro.qualcomm.cabl=0 \
#	persist.hwc.mdpcomp.enable=true \
#	persist.graphics.vulkan.disable=true \
#   debug.sf.latch_unsignaled=1 \
#	debug.sf.disable_backpressure=1 \
#	debug.sf.recomputecrop=0
