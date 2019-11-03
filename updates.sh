#!/bin/bash

set -e
source build/envsetup.sh

# bionic
changes=(
256150 # bionic: Use legacy pthread_mutex_init() behavior on pre-P API levels
256151 # Actually restore pre-P mutex behavior
)
repopick -P bionic ${changes[@]}&

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

# hardware/qcom-caf/msm8996/audio
changes=(
260610 # audio: Fix flac offload not working
260613 # audio: Extend platform parser to allow device name aliasing
260615 # hal: Add open source HAL for Elliptic Ultrasound
261894 # Build audio.primary.* with BOARD_VNDK_VERSION
)
repopick -P hardware/qcom-caf/msm8996/audio ${changes[@]}&

# hardware/qcom-caf/msm8996/display
changes=(
261895 # hwc: Set ioprio for vsync thread
)
repopick -P hardware/qcom-caf/msm8996/display ${changes[@]}&

# hardware/qcom-caf/msm8998/display
changes=(
261897 # hwc: Set ioprio for vsync thread
)
repopick -P hardware/qcom-caf/msm8998/display ${changes[@]}&

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

# packages/apps/Snap
changes=(
262664 # Revert "Remove CameraDataCallback."
262665 # Revert "SnapdragonCamera: Forbid volume key can take picture"
262666 # Revert "SnapdragonCamera: Reduce number of countdown timer option"
262667 # Revert "SnapdragonCamera: Add missing permissions"
262668 # Rename SnapdragonCamera to Snap
262669 # tests: fix class name
262670 # Snap: Use AOSP app label
262671 # Snap: Remove old icons
262672 # SnapdragonCamera: Initialize overlay before control-by-intent
262673 # Snap: Re-enable ZSL after exiting HDR mode
262674 # SnapdragonCamera: Hide UI after error-checking video preferences
262675 # camera: Add parameter debugging support
262676 # camera: Remove the luma-adaptation seekbar
262677 # Camera: Cleanup and compatibility fixes
262678 # camera: Add all focus modes, scene modes, and color effects.
262679 # Camera: Add red-eye flash mode support
262680 # camera: Check if video sizes are available
262681 # Camera2: enable antibanding by default
262682 # camera: Remove ICS hack to stop preview after takePicture
262683 # Camera: fix preview for landscape devices
262684 # Camera2: Don't report incorrect supported picture formats
262685 # Camera2: some aapt warnings cleanup
262686 # Camera2: Remove CAF video duration code
262687 # Camera2: implement exposure compensation settings in video mode
262688 # Camera: separate settings for color effects
262689 # Camera: Change volume hard key button to zoom function
262690 # Camera: Powerkey shutter (2/2)
262691 # Camera: Cleanup hardware key handling
262692 # Camera: Handle keys only while in app
262693 # Camera2: Headset shutter mode
262694 # Camera2: Add option to set max screen brightness
262695 # SnapdragonCamera: Reset camera state after taking picture
262696 # Snap: Add support for additional ISO values
262697 # add support for non-standard iso keys and values
262698 # Snap: Add support for luminance-condition parameter
262699 # option to set manufacturer specific parameters on startup
262700 # Snap: Add options to restart preview onPictureTaken
262701 # Snap: Make openLegacy an option
262702 # Snap: Add touch-to-focus timeout duration settings
262703 # Snap: Add support for shutter speed
262704 # Snap: Add support for mw_continuous-picture focus mode
262705 # Snap: Fall back to default quality for invalid video qualities
262706 # SnapdragonCamera: Fix incorrect viewfinder ratio for 13.1MP shots
262707 # CameraActivity: Handle NPE when film strip view is null
262708 # Snap: Remove CAF Chinese translations
262709 # Snap: Fix aapt warnings
262710 # Snap: Fix NPE when parameters.getSupportedVideoSizes() is null
262711 # Snap: Add special handling of hdr-mode parameter for LGE devices
262712 # Snap: Support for HTC's HDR mode
262713 # Snap: Remove touch AF/AEC option
262714 # Snap: Actually select the highest quality video by default
262715 # SnapdragonCamera: Add option to control antibanding in camcorder
262716 # SnapdragonCamera: Fix overly-aggressive auto rotation
262717 # SnapdragonCamera: Remove 'off' option for antibanding
262718 # SnapdragonCamera: Fix UI alignment glitches when nav-bar is enabled
262719 # Snap: Don't crash when hardcoded gallery intent fails
262720 # SnapdragonCamera: Set camera parameters before restarting preview
262721 # Fix crash if Exif-Tag buffer-length and component-count are both 0
262722 # Snap: Don't crash if user saved preference is not valid
262723 # SnapdragonCamera: Scale up bitrate for HSR recordings
262724 # Snap: Fix filtering of unsupported HFR/HSR modes
262725 # Snap: Remove auto HDR option when not supported
262726 # Snap: Remove video snapshot size when not supported
262727 # Snap: Remove face detection option if not supported
262728 # Snap: Fix incorrect preview layout surface size in landscape mode
262729 # Snap: Do not crash when cur-focus-scale is null
262730 # Snap: Fall back to REVIEW intent before VIEW intent
262731 # Fix view index tracking.
262732 # Snap: Support override maker and model exif tag
262733 # Snap: Extend user menu, disable dev menu
262734 # Snap: Make developer menu more accessible
262735 # Snap: Unbreak auto-HDR
262736 # snap: Add constrained longshot mode
262737 # Snap: Remove storage menu if no external storage available
262738 # CameraNext: dynamically generate available photo resolutions
262739 # Snap: add auto-hdr option to photo menu
262740 # Allow to re-open Snap from recent menu
262741 # Add orientation correction for landscape devices
262742 # camera: Touch focus support for camcorder
262743 # SnapdragonCamera: Add focus-mode option to camcorder
262744 # SnapdragonCamera: Always lock AE and AWB when auto-focus is used
262745 # SnapdragonCamera: Lock AE and AWB for tap-to-focus in camcorder
262746 # SnapdragonCamera: Unlock AE/AWB after taking a photo with ZSL
262747 # Snap: Expose video snapshot size setting
262748 # Snap: Add focus time support in camcorder
262749 # Snap: Add ability to set the tap-to-focus duration to 0 sec
262750 # Snap: Separate default focus time between camera/video
262751 # Camera2: Only autofocus before a snap if we are actually in "auto" mode.
262752 # camera: Keep touch focus intact during back-to-back ZSL shots
262753 # Snap: Fixes for advanced features and scene modes
262754 # Snap: grant android.permission.RECEIVE_BOOT_COMPLETED permisions
262755 # Snap: Materialize
262756 # Snap: Material toasts
262757 # Remove unused menu indicators code.
262758 # Snap: Add icons to all remaining preferences
262759 # Snap: Add icons to all scene modes
262760 # snap: Adjust top bar icon order
262761 # De-uglify menu.
262762 # Use material versions of share/delete/edit icons.
262763 # CameraNext: Fallback to do copy exif if exif not exist
262764 # CameraNext: don't crash when pref is not boolean
262765 # Show UI when pano stitch starts and remove cancel condition
262766 # snap: Panorama fixes
262767 # Fix broken filenames for cropped images
262768 # CropActivity: notify MediaScanner on save complete
262769 # CameraNext: stop updating the pano progress bar on pause
262770 # Grant read URI permission for playback of video capture
262771 # Make panorama able to go 270 degrees in landscape
262772 # CameraNext: Update focus behavior for panoramas
262773 # Stop data loader on activity destroy.
262774 # Initialize focus manager in onResume().
262775 # Snap: prevent NPE when checking if controls are visible
262776 # Snap: Detect and use Camera2 if available
262777 # Snap: CaptureModule: check if ZSL is supported before using it
262778 # Snap: Allow switching beyond just 2 cameras
262779 # Always apply frame size reduction to panorama pictures
262780 # Snap: Simulate back button press when menu back button is pressed
262781 # Never ignore finger swipes in gallery mode
262782 # Initialize focus overlay manager if it is not initialized.
262783 # Camera: Set preview fps after recording.
262784 # Snapdragon Camera: Use consistent API for preview fps reset
262785 # SnapdragonCamera: Longshot with Burst Functionality.
262786 # Protect against multiple shutter callbacks per frame in longshot mode.
262787 # ListPreference: prevent ArrayIndexOutOfBoundsException
262788 # VideoModule: don't set negative HFR value
262789 # SnapdragonCamera: Fix shutter button clicks in rapid succession getting ignored
262790 # SnapdragonCamera: Enforce 120ms delay in between shutter clicks
262791 # Snap: Render zoom circle in the center of the camera preview
262792 # Snap: Don't do touch-to-focus on top of UI elements
262793 # SnapdragonCamera: Add missing toast on HSR/HFR override
262794 # Snap: Show remaining photos on initial start
262795 # Snap: Disable warped pano preview
262796 # Snap: Increase default pano capture pixels to 1440x1000
262797 # Snap: Adjust scene and filter mode layout dimensions
262798 # Snap: Don't close slide out menu after selecting scene mode
262799 # Snap: Fix swipe right to open menu
262800 # Snap: Fix filter mode button after disabling HDR mode
262801 # Snap: Remove "help screen on first start" feature
262802 # Snap: Arrange video menu so it's similar to photo menu
262803 # Snap: Fix panorama layout
262804 # Removed littlemock dependency and cleanup
262805 # Snap: Rip out hdr-need-1x option
262806 # Snap: check tags before using them
262807 # QuickReader: initial commit
262808 # Snap: add QReader to module switch
262809 # Snap: Add missing thumbnails for filter modes
262810 # Snap: Port all string improvements from cm-14.1
262811 # Snap: adaptive icon
262812 # Snap: Convert "save best" dialog text to a quantity string
262813 # Snap: don't try to set up cameras with ids greater than MAX_NUM_CAM
262814 # Drop new focus indicator into Camera2.
262815 # Snap: Add support for focus distance
262816 # Snap: Configure focus ring preview dimensions
262817 # Snap: Check for ACCESS_FINE_LOCATION instead of ACCESS_COARSE_LOCATION
262818 # SnapdragonCamera: Panorama, replace border drawable
262819 # Snap: turn developer category title into a translatable string
262820 # Snap: Allow quickreader to work with secure device
262821 # CameraSettings: Do not crash if zoom ratios are not exposed
262822 # Snap: use platform cert
262823 # Fix force close when launch camera on P
262824 # DisableCameraReceiver: Initialize CameraHolder before use
262825 # SnapdragonCamera: SetParameters use the mParameters Object
262826 # SnapdragonCamera: Fix parameters NullPointerException
262827 # Fix to change default mode to Camera1 HAL1
262828 # Fix get aePref is null in PhotoMenu
262829 # Snap: Create correct redeye reduction config icon
262830 # Snap: Fix layout of zoom option
262831 # Snap: Check various feature support before applying
262832 # Snap: Add missing NULL check in updatePictureAndVideoSize()
262833 # Snap: Disable debugging of double open issue
262834 # Snap: Always allow 100% JPEG quality to be set
262835 # QuickReader: Update libs
262836 # Snap: Yet Another String Improvement
262837 # Snap: make support for bokeh mode configurable per device
262838 # Snap: Fix shutter button size
262839 # Snap: Remove unused resources
262840 # Snap: Add back original-package in manifest
262841 # Snap: Fix picture size preference
262842 # Snap: allow to disable image stabilization per device
262843 # snap: remove double resources
262844 # Snap: Fix Undo button behaviour
262845 # Stop using deprecated Canvas APIs.
262846 # Fix use of deprecated SoundPool API in Snap
262351 # Fix NPE when removing RAW setting
262847 # Snap: Grant android.permission.START_ACTIVITIES_FROM_BACKGROUND
262848 # Snap: Set CameraHolder context on camera button action
)
repopick -P packages/apps/Snap ${changes[@]}&

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

# packages/services/Telecomm
changes=(
256161 # Telecomm: Make sensitive phone numbers not to be shown in call log history.
256265 # CallLog: Take into account multiple SIMs for sensitive numbers
)
repopick -P packages/services/Telecomm ${changes[@]}&

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
