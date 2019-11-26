#!/bin/bash

set -e
source build/envsetup.sh

# bootable/recovery
changes=(
255831 # recovery: Get a proper shell environment in recovery
259434 # recovery: Puke out an /etc/fstab so stuff like busybox/toybox is happy
255979 # recovery: symlink /sbin for script compatibility
258978 # applypatch: Use static libs for libbrotli and libbz.
#259720 # recovery: sdcard is data/media/0
#259629 # recovery: Provide caching for sideload files
)
repopick ${changes[@]}&

# build/make
changes=(
257172 # releasetools: squash backuptool support
257177 # releasetools: Use the first entry of a mount point when reading fstab
259308 # build: Force system-as-root layout for backuptool
259309 # releasetools: Implement system-mount script to support any recovery system mount
257170 # build: Never set persist.sys.usb.config=none in recovery
257174 # releasetools: support reading release keys out of some sort of command
257175 # releasetools: Add script to sign zips
257176 # releasetools: Store the build.prop file in the OTA zip
257178 # build: allow forcing build of otatools
257099 # Make PRODUCT_BUILD_PROP_OVERRIDES bit more powerful
)
repopick -P build/make ${changes[@]}&

# build/soong
changes=(
256886 # soong: Add function to return camera parameters library name
)
repopick -P build/soong ${changes[@]}&

# external/tinycompress
changes=(
256308 # tinycompress: Enable extended compress format
)
repopick -P external/tinycompress ${changes[@]}&

# frameworks/av
changes=(
256899 # camera: Allow devices to load custom CameraParameter code
258812 # CameraService: Support hooks for motorized camera
)
repopick -P frameworks/av ${changes[@]}&

# frameworks/base
changes=(
256446 # SystemUI: Enable and fix QS detail view, adapt layout to Pie
256447 # SystemUI: Add Profiles tile
256448 # SystemUI: Advanced location tile
258303 # power: Re-introduce custom charging sounds
258546 # Camera button support
257246 # fingerprint: handle PerformanceStats NULL pointers
258754 # Keyguard: Allow disabling fingerprint wake-and-unlock
258820 # SystemUI: Add visualizer feature
258826 # SystemUI: Dismiss keyguard on boot if disabled by current profile
258827 # SystemUI: Don't dismiss keyguard if user key isn't unlocked
259458 # storage: Do not notify for volumes on non-removable disks
260002 # fw/b: Squash of app fw restriction commits
261314 # Allow override of DUN settings
263007 # SystemUI: get rid of build text in qs
256016 # Revert "Disable custom clock faces in SystemUI"
256015 # Revert "Disable ClockOptionsProvider so clocks don't appear in picker app"
263050 # etc: Add privapp whitelist permissions for ThemePicker
263116 # SystemUI: Revive navbar layout tuning via sysui_nav_bar tunable
255650 # Revert "Drop final remnants of Type clock face"
255647 # Revert "Drop Type clock face."
255651 # TypeClockController: Make it compile with new plugin API
)
repopick -P frameworks/base ${changes[@]}&

# frameworks/native
changes=(
258443 # sensorservice: Register orientation sensor if HAL doesn't provide it
258601 # sensorservice: customize sensor fusion mag filter via prop
259448 # libui: Allow invalid bits from callers conditionally
)
repopick -P frameworks/native ${changes[@]}&

# frameworks/opt/net/wifi
changes=(
261857 # wifi: Not reset country code for Dual SIM if any slot is active
)
repopick -P frameworks/opt/net/wifi ${changes[@]}&

# frameworks/opt/telephony
changes=(
262868 # Migrate GSM SignalStrength to WCDMA on HAL 1.0
262869 # Fix Issue Where SignalStrengthGsm is null
262870 # 2G wants proper signal strength too
)
repopick -P frameworks/opt/telephony ${changes[@]}&

# hardware/lineage/interfaces
changes=(
260411 # cryptfshw: Introduce qti backend implementation
)
repopick -P hardware/lineage/interfaces ${changes[@]}&

# hardware/qcom/data/ipacfg-mgr
changes=(
261831 # Kernel Header Changes
261832 # ipacfg-mgr: Use generated kernel headers
)
repopick -P hardware/qcom/data/ipacfg-mgr ${changes[@]}&

# packages/apps/DeskClock
changes=(
256664 # Make new menu entry to link to cLock widget settings.
)
repopick -P packages/apps/DeskClock ${changes[@]}&

# packages/apps/Email
changes=(
257361 # Revert "Revert "AOSP/Email - Changes for code to work with UnifiedEmail's ...
257362 # Revert "Revert "AOSP/Email - Bump targetSdkVersion to 28.""
#257363 # AOSP/Email - Bump version number to 28 in the XML file.
#257364 # AOSP/Email - Bumped version number to 28. Disabled notifications, uifolders ...
#257365 # AOSP/Email and AOSP/UnfiedEmail - Added back call to uiaccounts. + Added ...
)
repopick -P packages/apps/Email ${changes[@]}&

# packages/apps/LineageParts
changes=(
258825 # LineageParts: Reenable system profiles
260416 # Parts: Convert charging sound path to uri
260782 # LineageParts: Migrate to Android.bp
)
repopick -P packages/apps/LineageParts ${changes[@]}&

# packages/apps/Nfc
changes=(
256814 # NFCService: Add sysprop to prevent FW download during boot with NFC off.
260063 # NfcNci: make T3T/Nfc-F HCE optional
)
repopick -P packages/apps/Nfc ${changes[@]}&

# packages/apps/Settings
changes=(
258304 # Settings: Add LineageParts charging sound settings preference
258819 # Settings: Add lockscreen visualizer toggle
259315 # One does not simply become a Developer
259459 # storage: Do not allow eject for volumes on non-removable disks
259455 # Settings: per-app cellular data, vpn and wifi restrictions
261364 # Settings: Use landscape qrcode scanner layout for sw600dp
262884 # Don't change nouns in summaries to lower case for German
)
repopick -P packages/apps/Settings ${changes[@]}&

# packages/apps/SetupWizard
changes=(
257065 # Account for PhoneMonitor API change
)
repopick -P packages/apps/SetupWizard ${changes[@]}&

# packages/apps/ThemePicker
changes=(
263051 # Require wallpaper privapp whitelist package
256017 # ThemePicker: Properly update clock face setting
263057 # Properly catch exceptions
263058 # Specify we read and write launcher settings
)
repopick -P packages/apps/ThemePicker ${changes[@]}&

# packages/apps/Trebuchet
changes=(
263059 # Revert "Launcher3: Export GridOptionsProvider"
263060 # Revert "Add developer options for grid change for Styles"
263061 # Properly expose GridOptionsProvider
263062 # Specify the wallpaper picker package
263063 # Specify the component name to start the picker
262575 # Apply icon size modifications from old Trebuchet
262576 # Add a 5x4 workspace and switch to it
262577 # Add contacts app to hotseat
#263001 # Trebuchet: implement hidden & protected apps
#263005 # Trebuchet: add toggle for desktop and drawer labels
#263006 # Update default workspace
)
repopick -P packages/apps/Trebuchet ${changes[@]}&
 
# packages/services/Telephony
changes=(
256792 # Telephony: Add ERI configuration for U.S. Cellular
256793 # Telephony: Support muting by RIL command
256795 # Don't start SIP service before decrypted
)
repopick -P packages/services/Telephony ${changes[@]}&

# system/core
changes=(
264691 # adbd: Initialize adbroot status to false	
264692 # adbd: Make adbroot interface a static lib	
264693 # adb_root: Enforce caller UID	
264694 # adb_root: Add mutex to binder interface	
264695 # adb_root: Restart adbd when turning off root
256219 # utils: Threads: Handle empty thread names
)
repopick -P system/core ${changes[@]}&

# system/update_engine
changes=(
259363 # Move performance mode to top app
)
repopick -P system/update_engine ${changes[@]}&

# system/vold
changes=(
#258169 # vold: add support for more filesystems for public storage
#258170 # vold: Fix fsck on public volumes
#258171 # vold: Support internal storage partitions
#258172 # vold: Honor mount options for ext4/f2fs partitions
#258173 # vold: Mount ext4/f2fs portable storage with sdcard_posix
#258174 # vold ext4/f2fs: do not use dirsync if we're mounting adopted storage
#258175 # Fix the group permissions of the sdcard root.
258176 # vold: skip first disk change when converting MBR to GPT
258177 # vold: Allow reset after shutdown
258178 # vold: Accept Linux GPT partitions on external SD cards
)
repopick -P system/vold ${changes[@]}&

# vendor/lineage
changes=(
256960 # soong_config: add TARGET_NEEDS_NETD_DIRECT_CONNECT_RULE
259449 # config: Mark more gralloc bits as valid
259310 # prebuilt: Add a script to simplify A-only recovery system mount
257000 # Remove apicheck.mk
261292 # vendor/lineage: Fix dopush
261642 # vendor: make dopush recognize /vendor files
258204 # build: set build fingerprint for all devices
259683 # lineage: don't mount system during install{boot,recovery}
262320 # aosp_audio: copy our own old AOSP alarm variants
263052 # Build ThemePicker
263053 # Add overlay to specify our custom theme provider
263055 # Build Lineage Themes stub package
263873 # overlay: Update webview providers
255667 # adb insecure by default
)
repopick -P vendor/lineage ${changes[@]}&

wait

# build/make
repopick -P build/make -f 259858 # Sorry bro: 6 -> 3
