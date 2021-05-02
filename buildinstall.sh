. build/envsetup.sh  && lunch lineage_jflte-eng && mka recoveryimage
adb push out/target/product/jflte/recovery.img /sdcard/ && adb shell dd if=/sdcard/recovery.img of=/dev/block/platform/msm_sdcc.1/by-name/recovery && adb reboot recovery
