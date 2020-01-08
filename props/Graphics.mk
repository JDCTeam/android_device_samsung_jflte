# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=430 \
    ro.opengles.version=196608 \
   	ro.hwui.texture_cache_size=48 \
    ro.hwui.layer_cache_size=32 \
    ro.hwui.path_cache_size=8 \
    ro.hwui.shape_cache_size=2 \
    ro.hwui.gradient_cache_size=1 \
    ro.hwui.drop_shadow_cache_size=4 \
    ro.hwui.texture_cache_flush_rate=0.5 \
    ro.hwui.text_small_cache_width=1024 \
    ro.hwui.text_small_cache_height=512 \
    ro.hwui.text_large_cache_width=2048 \
    ro.hwui.text_large_cache_height=1024 \
	debug.cpurend.vsync=false \
	debug.composition.type=c2d \
    debug.hwui.use_buffer_age=false \
    debug.sf.enable_gl_backpressure=1

# Experimental
#PRODUCT_PROPERTY_OVERRIDES += \
#	ro.qualcomm.cabl=0 \
#	persist.hwc.mdpcomp.enable=true \
#	persist.graphics.vulkan.disable=true \
#   debug.sf.latch_unsignaled=1 \
#	debug.sf.disable_backpressure=1 \
#	debug.sf.recomputecrop=0