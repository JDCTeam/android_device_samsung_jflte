#
# Copyright (C) 2014 The CyanogenMod Project
# Copyright (C) 2018 JDCTeam
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
#

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    audio.offload.disable=1 \
    persist.audio.fluence.speaker=true \
    persist.audio.fluence.voicecall=true \
    qcom.hw.aac.encoder=true \
    ro.qc.sdk.audio.fluencetype=fluence \
    use.dedicated.device.for.voip=true \
    use.voice.path.for.pcm.voip=false
   
# ART
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-swap=false

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bt.bdaddr_path=/efs/bluetooth/bt_addr \
    persist.bt.enableAptXHD=true

# Calls
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.call_ring.delay=0 \
    ring.delay=0

# Charger
PRODUCT_PROPERTY_OVERRIDES += \
    ro.enable_boot_charger_mode=1


# Dex
PRODUCT_PROPERTY_OVERRIDES += \
    pm.dexopt.first-boot=quicken \
    pm.dexopt.boot=verify \
    pm.dexopt.install=quicken \
    pm.dexopt.nsys-library=quicken \
    pm.dexopt.shared-apk=quicken \
    pm.dexopt.forced-dexopt=quicken \
    pm.dexopt.core-app=quicken \
    dalvik.vm.image-dex2oat-Xms=64m \
    dalvik.vm.image-dex2oat-Xmx=64m \
    dalvik.vm.dex2oat-Xms=64m \
    dalvik.vm.dex2oat-Xmx=512m \
    dalvik.vm.dex2oat-swap=false \
    dalvik.vm.dex2oat-filter=quicken \
    dalvik.vm.image-dex2oat-threads=4 \
    dalvik.vm.usejit=true \
    dalvik.vm.usejitprofiles=true \
    dalvik.vm.execution-mode=int:fast \
    dalvik.vm.appimageformat=lz4 \
    dalvik.vm.image-dex2oat-filter=quicken \
    dalvik.vm.heapstartsize=16m \
    dalvik.vm.heapgrowthlimit=256m \
    dalvik.vm.heapsize=512m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=4m \
    dalvik.vm.heapmaxfree=8m \
    debug.atrace.tags.enableflags=0 \
    ro.dalvik.vm.native.bridge=0 \
    ro.kernel.android.checkjni=0 \
    ro.kernel.checkjni=0
    
# Display
PRODUCT_PROPERTY_OVERRIDES += \
    debug.hwui.use_buffer_age=false \
    debug.composition.type=c2d \
    ro.opengles.version=196608 \
    ro.sf.lcd_density=420

# GPS
PRODUCT_PROPERTY_OVERRIDES += \
    persist.gps.qc_nlp_in_use=1

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    camera2.portability.force_api=1 \
    mm.enable.smoothstreaming=true \
    persist.media.treble_omx=false \
    media.stagefright.enable-player=true \
    media.stagefright.enable-meta=true \
    media.stagefright.enable-scan=false \
    media.stagefright.enable-http=true \
    video.accelerate.hw=1

# NFC
PRODUCT_PROPERTY_OVERRIDES += \
   ro.nfc.port=I2C

# PerfD
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
   persist.radio.apm_sim_not_pwdn=1 \
   ro.ril.disable.power.collapse=0 \
   pm.sleep_mode=1 \
   rild.libpath=/system/vendor/lib/libril-qc-qmi-1.so
   
# Tethering
PRODUCT_PROPERTY_OVERRIDES += \
   net.tethering.noprovisioning=true

# Time
PRODUCT_PROPERTY_OVERRIDES += \
   persist.timed.enable=true

# Timeout failed shutdowns
PRODUCT_PROPERTY_OVERRIDES += \
   ro.build.shutdown_timeout=5

# WiFi
PRODUCT_PROPERTY_OVERRIDES += \
   wifi.interface=wlan0
    
    
