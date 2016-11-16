LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    libwvm_jflte.cpp

LOCAL_SHARED_LIBRARIES := libstagefright_foundation

LOCAL_MODULE := libwvm_jflte
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES

include $(BUILD_SHARED_LIBRARY)