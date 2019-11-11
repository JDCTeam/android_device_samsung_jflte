#!/bin/bash

set -e
source build/envsetup.sh

# bootable/recovery
changes=(
255990 # recovery: Remove HOST_OS guard for f2fs tools
255832 # recovery: ui: Default to touch enabled
255833 # recovery: ui: Minor cleanup for touch code
255992 # recovery: ui: Support hardware virtual keys
256010 # recovery: Include vendor init trigger
259546 # recovery: Allow device-specific recovery modules
259547 # recovery: Blank screen during shutdown and reboot
259548 # recovery: Provide sideload cancellation
259823 # otautil: add support for unmounting entire volumes
259642 # recovery: Add wipe system partition option
259643 # recovery: Remove "Supported API" message
259644 # recovery: Enable the menu for User builds
259645 # recovery: init: mount pstore fs
259646 # recovery: Expose reboot to recovery option
259647 # recovery: Only show tests in eng builds
259648 # recovery: Also hide rescue mode from non eng builds
259738 # recovery: Allow bypassing signature verification on non-release builds
259748 # recovery: Add runtime checks for A/B vs traditional updates
259649 # recovery: Blank screen on init
#255831 # recovery: Get a proper shell environment in recovery
#259434 # recovery: Puke out an /etc/fstab so stuff like busybox/toybox is happy
#259720 # recovery: sdcard is data/media/0
#259629 # recovery: Provide caching for sideload files
#255979 # recovery: symlink /sbin for script compatibility
#255830 # Make adb use a custom prop for adb root
)
repopick ${changes[@]}&

# build/make
changes=(
257172 # releasetools: squash backuptool support
257177 # releasetools: Use the first entry of a mount point when reading fstab
259308 # build: Force system-as-root layout for backuptool
259309 # releasetools: Implement system-mount script to support any recovery system mount
257166 # build: recovery: Support adding device-specific items
257167 # build: Separate commands in recovery foreach loops
257168 # Allow setting the recovery density separately from the aapt config
257170 # build: Never set persist.sys.usb.config=none in recovery
257173 # Edify: Add abort message for bootloader asserts
257174 # releasetools: support reading release keys out of some sort of command
257175 # releasetools: Add script to sign zips
257176 # releasetools: Store the build.prop file in the OTA zip
257178 # build: allow forcing build of otatools
257099 # Make PRODUCT_BUILD_PROP_OVERRIDES bit more powerful
260346 # build: Remove su inclusion
)
repopick -P build/make ${changes[@]}&

# build/soong
changes=(
256886 # soong: Add function to return camera parameters library name
)
repopick -P build/soong ${changes[@]}&

# device/lineage/sepolicy
changes=(
261929 # sepolicy: Allow Snap to execute bcc
257100 # [DNM] Kill su
)
repopick -P device/lineage/sepolicy ${changes[@]}&

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
#258530 # Use UnlockMethodCache#canSkipBouncer in user switcher
258159 # frameworks: base: Port password retention feature
258180 # Fix Build Credentials refactored to use byte[]
258160 # LockSettingsService: Support for separate clear key api
256446 # SystemUI: Enable and fix QS detail view, adapt layout to Pie
256447 # SystemUI: Add Profiles tile
256448 # SystemUI: Advanced location tile
258303 # power: Re-introduce custom charging sounds
258546 # Camera button support
257246 # fingerprint: handle PerformanceStats NULL pointers
258754 # Keyguard: Allow disabling fingerprint wake-and-unlock
257247 # fingerprint: notify client when cancelling succeeded
258753 # FingerprintService: add overlay to prevent cleanup of unused fingerprints
#thank aviraxp for using web UI to pick commits and not putting them in chain...
#260295 # PackageManager: allow build-time disabling of components
258820 # SystemUI: Add visualizer feature
258826 # SystemUI: Dismiss keyguard on boot if disabled by current profile
258827 # SystemUI: Don't dismiss keyguard if user key isn't unlocked
#258853 # Add CHANNEL_MODE_DUAL_CHANNEL constant
#258854 # Add Dual Channel into Bluetooth Audio Channel Mode developer options menu
#258855 # Allow SBC as HD audio codec in Bluetooth device configuration
259458 # storage: Do not notify for volumes on non-removable disks
260002 # fw/b: Squash of app fw restriction commits
261314 # Allow override of DUN settings
262045 # SystemUI: Allow disabling BrightlineFalsingManager with config flag
262889 # Disable doc generation
255646 # Revert "DO NOT MERGE Remove Privacy Indicators"
255648 # Revert "DO NOT MERGE Revert "Adding the privacy chip to the CarStatusBar""
255649 # PrivacyItemController: Enable permission hub by default
256016 # Revert "Disable custom clock faces in SystemUI"
256015 # Revert "Disable ClockOptionsProvider so clocks don't appear in picker app"
255650 # Revert "Drop final remnants of Type clock face"
255647 # Revert "Drop Type clock face."
255651 # TypeClockController: Make it compile with new plugin API
#256192 # [DNM] IS_DEBUGGABLE -> IS_ENG
)
repopick -P frameworks/base ${changes[@]}&

# frameworks/native
changes=(
258443 # sensorservice: Register orientation sensor if HAL doesn't provide it
258601 # sensorservice: customize sensor fusion mag filter via prop
259448 # libui: Allow invalid bits from callers conditionally
261898 # input: Adjust priority
)
repopick -P frameworks/native ${changes[@]}&

# frameworks/opt/telephony
changes=(
262868 # Migrate GSM SignalStrength to WCDMA on HAL 1.0
262869 # Fix Issue Where SignalStrengthGsm is null
262870 # 2G wants proper signal strength too
)
repopick -P frameworks/opt/telephony ${changes[@]}&

# hardware/interfaces
changes=(
258181 # keymasterV4_0: Tags support for FBE wrapped key.
)
repopick -P hardware/interfaces ${changes[@]}&

# hardware/lineage/interfaces
changes=(
258215 # Initial dummy cryptfshw implementation
260411 # cryptfshw: Introduce qti backend implementation
260069 # wifi: Disable softAP MAC randomization by default
)
repopick -P hardware/lineage/interfaces ${changes[@]}&

# hardware/qcom/data/ipacfg-mgr
changes=(
261831 # Kernel Header Changes
261832 # ipacfg-mgr: Use generated kernel headers
)
repopick -P hardware/qcom/data/ipacfg-mgr ${changes[@]}&

# hardware/qcom/keymaster
changes=(
260415 # keymaster: Reverse wait for qsee flag
)
repopick -P hardware/qcom/keymaster ${changes[@]}&

# lineage-sdk
changes=(
258333 # lineage-sdk: Bump PREF_HAS_MIGRATED_LINEAGE_SETTINGS for 17.0
259996 # lineage-sdk: Update path to ChargingStarted.ogg
)
repopick -P lineage-sdk ${changes[@]}&

# packages/apps/Bluetooth
#changes=(
#258859 # SBC Dual Channel (SBC HD Audio) support
#258860 # Assume optional codecs are supported if were supported previously
#)
#repopick -P packages/apps/Bluetooth ${changes[@]}&

# packages/apps/DeskClock
changes=(
256664 # Make new menu entry to link to cLock widget settings.
)
repopick -P packages/apps/DeskClock ${changes[@]}&

# packages/apps/Dialer
changes=(
257131 # Dialer: handle database upgrade from cm-14.1
257132 # Dialer: disable anti-falsing for call answer screen
257113 # Revert "Remove dialer sounds and vibrations settings fragments and redirect to the system sound
257114 # Add back in-call vibration features
257115 # Allow using private framework API.
257133 # Re-add dialer lookup.
257118 # Generalize the in-call vibration settings category
257119 # Add setting to enable Do Not Disturb during calls
257134 # Re-add call recording.
257121 # Allow per-call account selection.
257122 # Re-add call statistics.
257135 # Control dialer's incoming call proximity sensor check via an overlay
257136 # Dialer: AudioModeProvider: use wired route for usb headsets
)
repopick -P packages/apps/Dialer ${changes[@]}&

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

# packages/apps/Messaging
changes=(
257343 # Messaging: Implement per conversation channels
)
repopick -P packages/apps/Messaging ${changes[@]}&

# packages/apps/Nfc
changes=(
256814 # NFCService: Add sysprop to prevent FW download during boot with NFC off.
260063 # NfcNci: make T3T/Nfc-F HCE optional
)
repopick -P packages/apps/Nfc ${changes[@]}&

# packages/apps/PermissionController
changes=(
255658 # Revert "Remove Permissions Hub."
255659 # PermissionController: Enable permission hub by default
)
repopick -P packages/apps/PermissionController ${changes[@]}&

# packages/apps/Settings
changes=(
258304 # Settings: Add LineageParts charging sound settings preference
258819 # Settings: Add lockscreen visualizer toggle
#258856 # Add Dual Channel into Bluetooth Audio Channel Mode developer options menu
259315 # One does not simply become a Developer
259459 # storage: Do not allow eject for volumes on non-removable disks
259455 # Settings: per-app cellular data, vpn and wifi restrictions
261364 # Settings: Use landscape qrcode scanner layout for sw600dp
262883 # Fix duplicated entries in sound settings.
262884 # Don't change nouns in summaries to lower case for German
262886 # VolumePanel: fix showing notification volume slider when unlinked
)
repopick -P packages/apps/Settings ${changes[@]}&

# packages/apps/SetupWizard
changes=(
257065 # Account for PhoneMonitor API change
)
repopick -P packages/apps/SetupWizard ${changes[@]}&

# packages/apps/ThemePicker
changes=(
256017 # ThemePicker: Properly update clock face setting
)
repopick -P packages/apps/ThemePicker ${changes[@]}&

# packages/apps/Trebuchet
changes=(
#260143 # Trebuchet: prefer our wallpaper picker if possible
262575 # Apply icon size modifications from old Trebuchet
262576 # Add a 5x4 workspace and switch to it
262577 # Add contacts app to hotseat
)
repopick -P packages/apps/Trebuchet ${changes[@]}&

# packages/apps/UnifiedEmail
changes=(
257370 # Revert "Revert "AOSP/UnifiedEmail - Bumped the targetSdkVersion to 28 ...
#257371 # AOSP/Email and AOSP/UnfiedEmail - Added back call to uiaccounts. + Added ...
)
repopick -P packages/apps/UnifiedEmail ${changes[@]}&

# packages/providers/MediaProvider
changes=(
262193 # MediaProvider: Make sure to check the type when searching for sounds
)
repopick -P packages/providers/MediaProvider ${changes[@]}&

# packages/providers/TelephonyProvider
changes=(
256780 # TelephonyProvider: add upgrade support from cm-14.1
)
repopick -P packages/providers/TelephonyProvider ${changes[@]}&

# packages/services/Telephony
changes=(
256792 # Telephony: Add ERI configuration for U.S. Cellular
256793 # Telephony: Support muting by RIL command
256795 # Don't start SIP service before decrypted
)
repopick -P packages/services/Telephony ${changes[@]}&

# system/bt
#changes=(
#258857 # Increase maximum Bluetooth SBC codec bitrate for SBC HD
#258858 # Explicit SBC Dual Channel (SBC HD) support
#)
#repopick -P system/bt ${changes[@]}&

# system/core
changes=(
258166 # Add wrapped key support
256219 # utils: Threads: Handle empty thread names
#259650 # Make adb use a custom prop for adb root
)
repopick -P system/core ${changes[@]}&

# system/netd
changes=(
256959 # netd: Allow devices to force-add directly-connected routes
260003 # system/netd: Squash of app fw restriction commits
)
repopick -P system/netd ${changes[@]}&

# system/update_engine
changes=(
259363 # Move performance mode to top app
)
repopick -P system/update_engine ${changes[@]}&

# system/vold
changes=(
258131 # vold: Add Hardware FDE feature
258132 # system: vold: Remove crypto block device creation
258133 # vold: Wrapped key support for FBE
258134 # vold: Use separate flag for wrappedkey
258135 # Remove no longer relevant header file
258136 # vold: add support for clear key
258137 # Fix for CTS test CtsAppSecurityHostTestCases
258138 # vold: fix build error
258139 # vold: change to upgrade key if export fails
258141 # system: vold: fix block disk encryption to work with metadata encryption
258145 # Updates for migrated code upstream
258147 # system: vold: Close crypto block device if it was created
258148 # system: vold: pass proper extra params to load crypto device
258140 # system: vold: Use wrapped key for metadata encryption
258149 # [automerger] vold: resolve crypto device creation failure with dm-crypt skipped: 4b5c1b2db2
258150 # system: vold: Use ICE for UFS card
262319 # system: vold: Fix for ICE UFS card support
258151 # vold: Move QCOM HW FDE inclusion under Lineage namespace
258169 # vold: add support for more filesystems for public storage
258170 # vold: Fix fsck on public volumes
258171 # vold: Support internal storage partitions
258172 # vold: Honor mount options for ext4/f2fs partitions
258173 # vold: Mount ext4/f2fs portable storage with sdcard_posix
258174 # vold ext4/f2fs: do not use dirsync if we're mounting adopted storage
258175 # Fix the group permissions of the sdcard root.
258176 # vold: skip first disk change when converting MBR to GPT
258177 # vold: Allow reset after shutdown
258178 # vold: Accept Linux GPT partitions on external SD cards
258179 # Add "changepw" command to vdc.
)
repopick -P system/vold ${changes[@]}&

# vendor/lineage
changes=(
259981 # Revert "soong_config: Add flag for legacy HW FDE"
260414 # soong_config: Reverse wait for qsee flag
256960 # soong_config: add TARGET_NEEDS_NETD_DIRECT_CONNECT_RULE
259449 # config: Mark more gralloc bits as valid
259310 # prebuilt: Add a script to simplify A-only recovery system mount
257000 # Remove apicheck.mk
#259701 # extract_files: Add extract2() function
255667 # adb insecure by default
261292 # vendor/lineage: Fix dopush
261642 # vendor: make dopush recognize /vendor files
258204 # build: set build fingerprint for all devices
259683 # lineage: don't mount system during install{boot,recovery}
262320 # aosp_audio: copy our own old AOSP alarm variants
262174 # vendor: Add messaging app to power whitelist
262413 # privapp-permissions: Allow Snap to use android.permission.START_ACTIVITIES_FROM_BACKGROUND
262606 # overlay: Remove config_show4GForLTE
262169 # overlay: Clean up Settings overlay
)
repopick -P vendor/lineage ${changes[@]}&

# vendor/codeaurora/telephony
changes=(
257215 # Revert "IMS-VT: Low battery handling for Video calls"
)
repopick -P vendor/codeaurora/telephony ${changes[@]}&

wait

# build/make
repopick -P build/make -f 259858 # Sorry bro: 6 -> 3
