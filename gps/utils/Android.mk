LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

## Libs
LOCAL_SHARED_LIBRARIES := \
    libutils \
    libcutils \
    liblog

LOCAL_SRC_FILES += \
    loc_log.cpp \
    loc_cfg.cpp \
    msg_q.c \
    linked_list.c \
    loc_target.cpp \
    loc_timer.c \
    ../platform_lib_abstractions/elapsed_millis_since_boot.cpp


LOCAL_CFLAGS += \
     -fno-short-enums \
     -D_ANDROID_ \
     -Wno-error \
     -Wno-format \
     -Wno-unused-parameter

LOCAL_LDFLAGS += -Wl,--export-dynamic

LOCAL_HEADER_LIBRARIES := \
    libgps.utils_headers

LOCAL_MODULE := libgps.utils
LOCAL_MODULE_OWNER := qcom
LOCAL_VENDOR_MODULE := true

LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libgps.utils_headers
LOCAL_EXPORT_C_INCLUDE_DIRS := \
    $(LOCAL_PATH) \
    $(LOCAL_PATH)/../platform_lib_abstractions
include $(BUILD_HEADER_LIBRARY)
