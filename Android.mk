# Copyright (C) 2013 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)

ifeq ($(BOARD_VENDOR),samsung)
ifeq ($(TARGET_BOARD_PLATFORM),msm8960)
ifneq ($(filter jflte jfvelte,$(TARGET_DEVICE)),)

include $(call all-subdir-makefiles,$(LOCAL_PATH))

FIRMWARE_MDM_IMAGES := \
    acdb.mbn \
    apps.mbn \
    dsp1.mbn dsp2.mbn dsp3.mbn \
    efs1.mbn efs2.mbn efs3.mbn \
    mdm_acdb.img \
    rpm.mbn \
    sbl1.mbn \
    sbl2.mbn

FIRMWARE_MDM_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/firmware/,$(notdir $(FIRMWARE_MDM_IMAGES)))
$(FIRMWARE_MDM_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware-mdm/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(FIRMWARE_MDM_SYMLINKS)

FIRMWARE_IMAGES := \
    q6.b00 q6.b01 q6.b03 q6.b04 q6.b05 q6.b06 q6.mdt \
    tzapps.b00 tzapps.b01 tzapps.b02 tzapps.b03 tzapps.mdt

FIRMWARE_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/firmware/,$(notdir $(FIRMWARE_IMAGES)))
$(FIRMWARE_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(FIRMWARE_SYMLINKS)

VIDC_IMAGES := \
    vidc.b00 vidc.b01 vidc.b02 vidc.b03 vidc.mdt

VIDC_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/firmware/,$(notdir $(VIDC_IMAGES)))
$(VIDC_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(VIDC_SYMLINKS)

WCNSS_IMAGES := \
    wcnss.b00 wcnss.b01 wcnss.b02 wcnss.b04 wcnss.b05 \
    wcnss.b06 wcnss.mdt

WCNSS_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/firmware/,$(notdir $(WCNSS_IMAGES)))
$(WCNSS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "WCNSS firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(WCNSS_SYMLINKS)

$(shell mkdir -p $(TARGET_OUT_VENDOR)/firmware/wlan/prima; \
	ln -sf /vendor/etc/wifi/WCNSS_qcom_cfg.ini \
		$(TARGET_OUT_VENDOR)/firmware/wlan/prima/WCNSS_qcom_cfg.ini)

$(shell mkdir -p $(TARGET_OUT_VENDOR)/firmware/wcd9310; \
	ln -sf /data/misc/audio/wcd9310_anc.bin \
		$(TARGET_OUT_VENDOR)/firmware/wcd9310/wcd9310_anc.bin; \
	ln -sf /data/misc/audio/mbhc.bin \
		$(TARGET_OUT_VENDOR)/firmware/wcd9310/wcd9310_mbhc.bin)

endif
endif
endif
