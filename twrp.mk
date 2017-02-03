PRODUCT_COPY_FILES += device/samsung/jf-common/rootdir/etc/twrp.fstab:recovery/root/etc/twrp.fstab

RECOVERY_VARIANT := twrp
LZMA_RAMDISK_TARGETS := recovery

BOARD_HAS_NO_REAL_SDCARD := true
DEVICE_RESOLUTION := 1080x1920
RECOVERY_GRAPHICS_USE_LINELENGTH := true
RECOVERY_SDCARD_ON_DATA := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun0/file
TW_BRIGHTNESS_PATH := /sys/devices/platform/msm_fb.526593/leds/lcd-backlight/brightness
TW_HAS_DOWNLOAD_MODE := true
TW_NO_REBOOT_BOOTLOADER := true
TW_USE_TOOLBOX := true

TW_INCLUDE_CRYPTO := true
TW_CRYPTO_FS_FLAGS := "0x00000406"
TW_CRYPTO_FS_OPTIONS := "nosuid,nodev,noatime,noauto_da_alloc,discard,journal_async_commit,errors=panic      wait,check,encryptable=footer"
TW_CRYPTO_FS_TYPE := "ext4"
TW_CRYPTO_REAL_BLKDEV := "/dev/block/platform/msm_sdcc.1/by-name/userdata"