LOCAL_PATH := $(call my-dir)

#$(error echo $(TARGET_OUT_VENDOR_ETC))

include $(CLEAR_VARS)
LOCAL_MODULE           := fstab.qcom
LOCAL_MODULE_TAGS      := optional
LOCAL_MODULE_CLASS     := ETC
LOCAL_SRC_FILES        := fstab.qcom
LOCAL_MODULE_PATH      := $(TARGET_OUT_VENDOR_ETC)
include $(BUILD_PREBUILT)

#include $(CLEAR_VARS)
#LOCAL_MODULE           := fstab.ramdisk
#LOCAL_MODULE_TAGS      := optional
#LOCAL_MODULE_CLASS     := ETC
#LOCAL_SRC_FILES        := fstab.ramdisk
#LOCAL_MODULE_PATH      := $(TARGET_COPY_OUT_RAMDISK)
#include $(BUILD_PREBUILT)


include $(CLEAR_VARS)
LOCAL_MODULE           := init.qcom.power.rc
LOCAL_MODULE_TAGS      := optional
LOCAL_MODULE_CLASS     := ETC
LOCAL_SRC_FILES        := init.qcom.power.rc
LOCAL_MODULE_PATH      := $(TARGET_OUT_VENDOR_ETC)/init/hw/init.qcom.power.rc 
include $(BUILD_PREBUILT)

#include $(CLEAR_VARS)
#LOCAL_MODULE           := init.recovery.qcom.power.rc
#LOCAL_MODULE_TAGS      := optional
#LOCAL_MODULE_CLASS     := ETC
#LOCAL_SRC_FILES        := init.qcom.power.rc
#LOCAL_MODULE_PATH      := recovery/root/init.recovery.qcom.rc
#include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE           := init.qcom.rc
LOCAL_MODULE_TAGS      := optional
LOCAL_MODULE_CLASS     := ETC
LOCAL_SRC_FILES        := init.qcom.power.rc
LOCAL_MODULE_PATH      := $(TARGET_OUT_VENDOR_ETC)/init/hw/init.qcom.rc 
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE           := init.qcom.usb.rc
LOCAL_MODULE_TAGS      := optional
LOCAL_MODULE_CLASS     := ETC
LOCAL_SRC_FILES        := init.qcom.power.rc
LOCAL_MODULE_PATH      := $(TARGET_OUT_VENDOR_ETC)/init/hw/init.qcom.usb.rc
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE           := ueventd.qcom.rc
LOCAL_MODULE_TAGS      := optional
LOCAL_MODULE_CLASS     := ETC
LOCAL_SRC_FILES        := ueventd.qcom.rc
LOCAL_MODULE_PATH      := $(TARGET_OUT_VENDOR_ETC)/ueventd.qcom.rc
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE           := ueventd.qcom.jf.rc
LOCAL_MODULE_TAGS      := optional
LOCAL_MODULE_CLASS     := ETC
LOCAL_SRC_FILES        := ueventd.qcom.rc
LOCAL_MODULE_PATH      := $(TARGET_OUT_VENDOR_ETC)/ueventd.rc
include $(BUILD_PREBUILT)
