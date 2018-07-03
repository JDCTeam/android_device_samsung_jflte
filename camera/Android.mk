LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_C_INCLUDES += \
    system/media/camera/include

LOCAL_SRC_FILES := \
    CameraWrapper.cpp

LOCAL_SHARED_LIBRARIES := \
    libhardware liblog libcamera_client libutils \
    libgui android.hidl.token@1.0-utils \

LOCAL_STATIC_LIBRARIES := libarect libbase

LOCAL_CFLAGS += -O0
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE := camera.msm8960
LOCAL_MODULE_TAGS := optional
LOCAL_PROPRIETARY_MODULE := true

include $(BUILD_SHARED_LIBRARY)
