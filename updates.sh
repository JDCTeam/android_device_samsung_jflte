#!/bin/bash

set -e
source build/envsetup.sh

# bionic
changes=(
256150 # bionic: Use legacy pthread_mutex_init() behavior on pre-P API levels
256151 # Actually restore pre-P mutex behavior
)
repopick ${changes[@]}&

# bootable/recovery
changes=(
255990 # recovery: Remove HOST_OS guard for f2fs tools
255831 # recovery: Get a proper shell environment in recovery
255832 # recovery: ui: Default to touch enabled
255833 # recovery: ui: Minor cleanup for touch code
255992 # recovery: ui: Support hardware virtual keys
259434 # recovery: Puke out an /etc/fstab so stuff like busybox/toybox is happy
256010 # recovery: Include vendor init trigger
259546 # recovery: Allow device-specific recovery modules
259547 # recovery: Blank screen during shutdown and reboot
259720 # recovery: sdcard is data/media/0
259629 # recovery: Provide caching for sideload files
259548 # recovery: Provide sideload cancellation
259823 # otautil: add support for unmounting entire volumes
259642 # recovery: Add wipe system partition option
259643 # recovery: Remove "Supported API" message
259644 # recovery: Enable the menu for User builds
259645 # recovery: init: mount pstore fs
259646 # recovery: Expose reboot to recovery option
259647 # recovery: Only show tests in eng builds
259648 # recovery: Also hide rescue mode from non eng builds
259649 # recovery: Blank screen on init
255979 # recovery: symlink /sbin for script compatibility
259738 # recovery: Allow bypassing signature verification on non-release builds
259748 # recovery: Add runtime checks for A/B vs traditional updates
255830 # Make adb use a custom prop for adb root
)
repopick ${changes[@]}&

# build/blueprint
changes=(
259301 # Make off-the-shelf order funcs public.
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
repopick ${changes[@]}&

# build/soong
changes=(
256886 # soong: Add function to return camera parameters library name
259286 # Add android_app_import.
259287 # uncompressedDex option for android_app_import.
259288 # Implement DPI variants in android_app_import.
259289 # androidmk conversion logic for android_app_import
259290 # Improve android_app_import.dpi_variants handling.
259291 # Add filename property to android_app_import
259292 # Add arch variant support to android_app_import.
259293 # Add default_dev_cert to android_app_import
259511 # New AndroidMk authoring system based on entry map.
259512 # Add data property to sh_test.
259513 # Add sh_test_host.
259514 # Add overrides property to prebuilt_apex
259515 # AndroidMkEntries minor refactoring.
259516 # Comment out broken android_app_imports tests
261076 # soong: Give priority to modules in exported namespaces for bootjars
)
repopick ${changes[@]}&

# device/lineage/sepolicy
changes=(
259621 # sepolicy: qcom: RIP legacy
261929 # sepolicy: Allow Snap to execute bcc
257100 # [DNM] Kill su
)
repopick ${changes[@]}&

# external/mksh
changes=(
259638 # mksh: Mark mkshrc as recovery_available
)
repopick ${changes[@]}&

# external/tinycompress
changes=(
256308 # tinycompress: Enable extended compress format
)
repopick ${changes[@]}&

# frameworks/av
changes=(
256899 # camera: Allow devices to load custom CameraParameter code
258812 # CameraService: Support hooks for motorized camera
)
repopick ${changes[@]}&

# frameworks/base
changes=(
#258530 # Use UnlockMethodCache#canSkipBouncer in user switcher
258159 # frameworks: base: Port password retention feature
258180 # Fix Build Credentials refactored to use byte[]
258160 # LockSettingsService: Support for separate clear key api
256163 # Configurable 0, 90, 180 and 270 degree rotation
256164 # SystemUI: Fix toggling lockscreen rotation [1/3]
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
258853 # Add CHANNEL_MODE_DUAL_CHANNEL constant
258854 # Add Dual Channel into Bluetooth Audio Channel Mode developer options menu
258855 # Allow SBC as HD audio codec in Bluetooth device configuration
259458 # storage: Do not notify for volumes on non-removable disks
260002 # fw/b: Squash of app fw restriction commits
261314 # Allow override of DUN settings
255646 # Revert "DO NOT MERGE Remove Privacy Indicators"
255648 # Revert "DO NOT MERGE Revert "Adding the privacy chip to the CarStatusBar""
255649 # PrivacyItemController: Enable permission hub by default
256016 # Revert "Disable custom clock faces in SystemUI"
256015 # Revert "Disable ClockOptionsProvider so clocks don't appear in picker app"
255650 # Revert "Drop final remnants of Type clock face"
255647 # Revert "Drop Type clock face."
255651 # TypeClockController: Make it compile with new plugin API
256192 # [DNM] IS_DEBUGGABLE -> IS_ENG
)
repopick ${changes[@]}&

# frameworks/native
changes=(
258443 # sensorservice: Register orientation sensor if HAL doesn't provide it
258601 # sensorservice: customize sensor fusion mag filter via prop
259448 # libui: Allow invalid bits from callers conditionally
261898 # input: Adjust priority
)
repopick ${changes[@]}&

# frameworks/opt/net/wifi
changes=(
261857 # wifi: Not reset country code for Dual SIM if any slot is active
)
repopick ${changes[@]}&

# hardware/broadcom/libbt
changes=(
261899 # correct WBS config VSC params
)
repopick ${changes[@]}&

# hardware/interfaces
changes=(
258181 # keymasterV4_0: Tags support for FBE wrapped key.
)
repopick ${changes[@]}&

# hardware/lineage/interfaces
changes=(
258215 # Initial dummy cryptfshw implementation
260411 # cryptfshw: Introduce qti backend implementation
260069 # wifi: Disable softAP MAC randomization by default
)
repopick ${changes[@]}&

# hardware/qcom/data/ipacfg-mgr
changes=(
261831 # Kernel Header Changes
261832 # ipacfg-mgr: Use generated kernel headers
)
repopick ${changes[@]}&

# hardware/qcom/keymaster
changes=(
260415 # keymaster: Reverse wait for qsee flag
)
repopick ${changes[@]}&

# hardware/qcom-caf/msm8996/audio
changes=(
260609 # audio: Fix complilation errors under Clang
260610 # audio: Fix flac offload not working
260613 # audio: Extend platform parser to allow device name aliasing
260615 # hal: Add open source HAL for Elliptic Ultrasound
260616 # audio: Use libprocessgroup unconditionally
260617 # audio: Use normal tinycompress
261894 # Build audio.primary.* with BOARD_VNDK_VERSION
)
repopick ${changes[@]}&

# hardware/qcom-caf/msm8996/display
changes=(
261895 # hwc: Set ioprio for vsync thread
)
repopick ${changes[@]}&

# hardware/qcom-caf/msm8998/display
changes=(
261897 # hwc: Set ioprio for vsync thread
)
repopick ${changes[@]}&

# lineage-sdk
changes=(
258333 # lineage-sdk: Bump PREF_HAS_MIGRATED_LINEAGE_SETTINGS for 17.0
259996 # lineage-sdk: Update path to ChargingStarted.ogg
)
repopick ${changes[@]}&

# packages/apps/Bluetooth
changes=(
258859 # SBC Dual Channel (SBC HD Audio) support
258860 # Assume optional codecs are supported if were supported previously
)
repopick ${changes[@]}&

# packages/apps/Contacts
changes=(
256654 # Contacts: Enable support for device contact.
256655 # Place MyInfo shortcut on drawer
256656 # Place EmergencyInfo shortcut on drawer
256657 # Allow calling contacts via specific phone accounts.
#256658 # Contacts: use white nav bar
)
repopick ${changes[@]}&

# packages/apps/DeskClock
changes=(
256663 # Provide upgrade path for cm-14.1 -> lineage-16.0
256664 # Make new menu entry to link to cLock widget settings.
)
repopick ${changes[@]}&

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
repopick ${changes[@]}&

# packages/apps/Email
changes=(
256675 # Email: handle databases from cm-14.1
256676 # Allow account deletion.
256677 # email: support for auto-sync multiple IMAP folders
256678 # email: Add an ActionBar to the mail app's PreferenceActivity
256679 # email: support per-folder notifications
256680 # Rewrite MailboxSettings loading logic.
256681 # email: fix eas autodiscover
256682 # Implement IMAP push using IMAP IDLE.
256683 # Request battery optimization exemption if IMAP IDLE is used.
256684 # Fix crash when attempting to view EML files.
256685 # Allow download of compressed attachments.
256686 # email: fix empty body update
256687 # Improve notification coalescence algorithm.
256688 # Email: Fix the ActivityNotFoundException when click "Update now"
256689 # Email: Clean duplicated WRITE_CONTACTS permission
256690 # email: return default folder name for subfolders
256691 # email: junk icon
256692 # Search in folder specified via URI parameter, if possible.
256693 # Remove max aspect ratio.
257358 # Fix Email tests on userdebug builds.
257360 # Remove build-time dep on opt-datetimepicker
257361 # Revert "Revert "AOSP/Email - Changes for code to work with UnifiedEmail's ...
257362 # Revert "Revert "AOSP/Email - Bump targetSdkVersion to 28.""
#257363 # AOSP/Email - Bump version number to 28 in the XML file.
#257364 # AOSP/Email - Bumped version number to 28. Disabled notifications, uifolders ...
#257365 # AOSP/Email and AOSP/UnfiedEmail - Added back call to uiaccounts. + Added ...
)
repopick ${changes[@]}&

# packages/apps/Exchange
changes=(
257297 # Exchange: Migrate to androidx
)
repopick ${changes[@]}&

# packages/apps/LineageParts
changes=(
256409 # LineageParts: Reenable DisplayRotation
258825 # LineageParts: Reenable system profiles
260416 # Parts: Convert charging sound path to uri
260782 # LineageParts: Migrate to Android.bp
)
repopick ${changes[@]}&

# packages/apps/Messaging
changes=(
256720 # Messaging: Fix generating id in android namespace
257324 # AOSP/Messaging - Update the Messaging version to 24 until notification related logic changes are made. Fixes the error "Developer warning for package com.android. messaging failed to post notification on channel null".
257325 # AOSP/Messaging - Remove TEST_MAPPING because presubmit tests fail on build_target: aosp_cf_x86_phone-userdebug
257326 # AOSP/Messaging - Moved LOCAL_COMPATIBILITY_SUITE to tests/Android.mk. + Deleted the unnecessary blankId check. Updated the TODO comment for NUM_TEST_CONVERSATIONS+4. + Added AndroidTest.xml + Added "LOCAL_PROGUARD_ENABLED := disabled" for tests to pass on cf.
257327 # AOSP/Messaging - Fix many improperly formatted resource strings in Messaging.
257328 # Fix X-Mms-Transaction-ID of M-Acknowledge.ind
257329 # Fix SMS status handling
257330 # Use correct format info for SMS
257331 # Fix MMS Config issues in Debug menu
257332 # Fix assertion failures caused by different instance type
257333 # Fix wrong PreferenceCategory for SMS delivery report
257334 # Apply new duplication detection logic for M-Notification.ind
257335 # Replace no error code '0' for SMS with '-1'
257336 # Fix GetOrCreateConversationActionTest failure
257337 # Sort ParticipantsData in order of the slot id
257338 # Ignore unexpected ACTION_DOWN for SIM avatar icons
257339 # Fix FATAL EXCEPTION on SmsStorageLowWarningActivity
257340 # Move Messaging to /product
257341 # Move libgiftranscode.so to /product
256696 # Messaging: define app category
256697 # Messaging: adaptive icon
256698 # Messaging: Implement option for swipe right to delete.
256699 # Messaging: change Avatar fontFamily to sans-serif-medium
256700 # MessageQueue: Process pending messages per subscription
256701 # Messaging: Toggable keyboard emoticons access
256702 # Fix menu item highlight color.
256704 # Messaging: bring back accent color
256705 # Messaging: Implement saved video attachments in MMS
256706 # Play an audible notification on receiving a class zero message.
256707 # Added support for video and audio mms attachments
256708 # Fixed storage permission issue for attachments
256709 # Messaging app crashes after a few MMS
256711 # Messaging: fix bad recycle on sending two mms in a row
256712 # MediaPicker: Check for NPE
256713 # Messaging: Don't crash on unsupported shared content type
256714 # Messaging: Fix crash of blocked participant list activity
256715 # Messaging: Add "Mark as read" quick action for message notifications
256716 # Allow intent shared subject or title to be mms subject
256718 # Messaging: use white nav bar
257342 # Don't build with platform certificate
257343 # Messaging: Implement per conversation channels
)
repopick ${changes[@]}&

# packages/apps/Nfc
changes=(
256814 # NFCService: Add sysprop to prevent FW download during boot with NFC off.
260063 # NfcNci: make T3T/Nfc-F HCE optional
)
repopick ${changes[@]}&

# packages/apps/PackageInstaller
changes=(
255658 # Revert "Remove Permissions Hub."
255659 # PermissionController: Enable permission hub by default
)
repopick ${changes[@]}&

# packages/apps/Settings
changes=(
256162 # Settings: Add rotation settings
258304 # Settings: Add LineageParts charging sound settings preference
258819 # Settings: Add lockscreen visualizer toggle
258856 # Add Dual Channel into Bluetooth Audio Channel Mode developer options menu
#259315 # One does not simply become a Developer
259459 # storage: Do not allow eject for volumes on non-removable disks
259455 # Settings: per-app cellular data, vpn and wifi restrictions
261351 # Settings: Fix QrCamera crash on devices without flash
261364 # Settings: Use landscape qrcode scanner layout for sw600dp
)
repopick ${changes[@]}&

# packages/apps/SetupWizard
changes=(
257065 # Account for PhoneMonitor API change
)
repopick ${changes[@]}&

# packages/apps/ThemePicker
changes=(
256017 # ThemePicker: Properly update clock face setting
)
repopick ${changes[@]}&

# packages/apps/Trebuchet
changes=(
260143 # Trebuchet: prefer our wallpaper picker if possible
)
repopick ${changes[@]}&

# packages/apps/UnifiedEmail
changes=(
256727 # unified email: prefer account display name to sender name
256728 # email: fix back button
256729 # unified-email: check notification support prior to create notification objects
256730 # unified-email: respect swipe user setting
256731 # email: linkify urls in plain text emails
256732 # email: do not close the input attachment buffer in Conversion#parseBodyFields
256733 # email: linkify phone numbers
256734 # Remove obsolete theme.
256735 # Don't assume that a string isn't empty
256736 # Add an ActionBar to the mail app's PreferenceActivity.
256737 # email: allow move/copy operations to more system folders
256738 # unifiedemail: junk icon
256739 # Remove mail signatures from notification text.
256740 # MimeUtility: ensure streams are always closed
256741 # Fix cut off notification sounds.
256742 # Pass selected folder to message search.
256743 # Properly close body InputStreams.
256744 # Make navigation drawer extend over status bar.
256745 # Disable animations for translucent activities.
256746 # Don't re-show search bar on query click.
257366 # Fix UnifiedEmail tests on userdebug builds.
257367 # AOSP/UnifiedEmail -  Fix improperly formatted resource strings in UnifiedEmail.
257368 # Remove build-time dep on opt-datetimepicker
257369 # Import translations. DO NOT MERGE]
257370 # Revert "Revert "AOSP/UnifiedEmail - Bumped the targetSdkVersion to 28 ...
#257371 # AOSP/Email and AOSP/UnfiedEmail - Added back call to uiaccounts. + Added ...
)
repopick ${changes[@]}&

# packages/providers/ContactsProvider
changes=(
256773 # ContactsProvider: Prevent device contact being deleted.
256774 # CallLogDatabase: Try to re-run the version 5 upgrade path
)
repopick ${changes[@]}&

# packages/providers/TelephonyProvider
changes=(
256780 # TelephonyProvider: add upgrade support from cm-14.1
)
repopick ${changes[@]}&

# packages/services/Telecomm
changes=(
256161 # Telecomm: Make sensitive phone numbers not to be shown in call log history.
256265 # CallLog: Take into account multiple SIMs for sensitive numbers
)
repopick ${changes[@]}&

# packages/services/Telephony
changes=(
256792 # Telephony: Add ERI configuration for U.S. Cellular
256793 # Telephony: Support muting by RIL command
256794 # Fix non-protected broadcasts sent from phone process.
256795 # Don't start SIP service before decrypted
256797 # Allow to disable the new scan API for manual network search.
)
repopick ${changes[@]}&

# platform_testing
changes=(
257354 # Remove LauncherRotationStressTest; Launcher2 was removed
257355 # Revert "Test: Manually tested."
257356 # Revert "Test: Manually tested."
257357 # Revert "Add PlatformScenarioTests to test artifacts."
)
repopick ${changes[@]}&

# system/bt
changes=(
258857 # Increase maximum Bluetooth SBC codec bitrate for SBC HD
258858 # Explicit SBC Dual Channel (SBC HD) support
)
repopick ${changes[@]}&

# system/core
changes=(
258166 # Add wrapped key support
256219 # utils: Threads: Handle empty thread names
261945 # fs_mgr: Fix EnsurePathMounted with a given mount_point.
259414 # reboot: mark as recovery_available
260334 # fs_mgr: mount: don't set the block device as ro for recovery
261075 # Revert "Format formattable partitions if mount fails"
259650 # Make adb use a custom prop for adb root
)
repopick ${changes[@]}&

# system/netd
changes=(
256959 # netd: Allow devices to force-add directly-connected routes
260003 # system/netd: Squash of app fw restriction commits
)
repopick ${changes[@]}&

# system/update_engine
changes=(
259363 # Move performance mode to top app
)
repopick ${changes[@]}&

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
repopick ${changes[@]}&

# vendor/lineage
changes=(
259981 # Revert "soong_config: Add flag for legacy HW FDE"
260414 # soong_config: Reverse wait for qsee flag
256960 # soong_config: add TARGET_NEEDS_NETD_DIRECT_CONNECT_RULE
259449 # config: Mark more gralloc bits as valid
259310 # prebuilt: Add a script to simplify A-only recovery system mount
257000 # Remove apicheck.mk
259699 # extract_files: Support system/ prefixes
259701 # extract_files: Add extract2() function
260081 # extract_files: Match non-treble path prefixes
258774 # extract_files: Add initial blueprint creation
258775 # extract_files: Implement blueprint file generation
260417 # extract_utils: Added Suffix uses COMMON_SUFFIX
255667 # adb insecure by default
261292 # vendor/lineage: Fix dopush
261642 # vendor: make dopush recognize /vendor files
258204 # build: set build fingerprint for all devices
259683 # lineage: don't mount system during install{boot,recovery}
)
repopick ${changes[@]}&

# vendor/codeaurora/telephony
changes=(
257215 # Revert "IMS-VT: Low battery handling for Video calls"
)
repopick ${changes[@]}&

# vendor/qcom/opensource/fm-commonsys
changes=(
260194 # Revert "FM: Use btconfigstore interface to fetch vendor features"
260195 # Revert "Fm: Use btconfigstore interface to fetch vendor features"
260422 # jni: fix calibration data path for legacy fm_qsoc_patches
260423 # jni: Skip loading FM firmware if requested
260429 # jni: Remove unused variables
260431 # jni: Resolve FM_DEVICE_PATH R/O open flag
260432 # jni: Ignore unused parameters from APIs
260434 # jni: Resolve equality comparisons with extraneous parentheses
260435 # jni: Resolve V4L2_CID_AUDIO_MUTE redefinitions
260436 # jni: Resolve -Wwritable-strings warnings in helium FW library variables
260437 # Allow library to be used by apps directly
260438 # FM: Break bootclasspath dependency
260439 # FM: Re-vamp UI
260440 # FM: Restore seek arrows
260441 # FM: Make default country an overlay
260442 # FM: Re-add RDS fields to UI
260443 # FM: Scanned frequencies are saved in ascending ordering
260444 # FM: Call unregister in onPause
260445 # FM: Switch file extension to aac
260446 # FM: Add property to force use internal antenna
260447 # FM: Cleanup resources
260448 # FM: add Indonesia
260449 # FM: materialize
260450 # FM: retune last frequency when resume after call
260451 # FM: Store tag num/value in sequence
260452 # FM: reenable radio text visibility after station info updated
260453 # FM: Launch station list automatically after scan
260454 # FM: Fix status text to reflect when FM is enabled.
260455 # FM: The collect channel disappear when quit FM
260456 # FM: Ensure scan state is kept in sync
260457 # FM: Keep track of scanned frequencies in service
260458 # FM: Select band based on country
260459 # FM: improved band selection
260460 # FM: Localization of band types
260461 # FM: Fix settings UI bugs
260462 # FM: Fix headphone icon
260463 # FM: Update India bands
260464 # FM: Convert regional band arrays to string references
260465 # FM: Fix KHz->kHz
260487 # FM: Revamp notifications
260488 # FM: adaptive icon
260489 # fm: Drop unnecessary dependencies
260490 # FM: Remove unnecessary TARGET_BOARD_PLATFORM guard
)
repopick ${changes[@]}&

# vendor/qcom/opensource/power
changes=(
261751 # power: Find online CPU core and get scaling governor
260232 # power: Clean up and fix video encode/decode hint handling
260233 # power: Clean up and fix set_interactive_override
260234 # power: msm8996: Support VR + Sustained performance mode
260235 # power: Add known perf hint IDs
261752 # power: Use declared enums where possible
260236 # power: perform_hint_action: return an error code
260237 # power: Use monotonic time for interaction boost
260238 # power: Handle launch and interaction hints for perf HAL platforms
260239 # power: Handle launch and interaction hints for legacy platforms
261753 # power: msm8916: Drop MIN_FREQ tweak for 8939
260240 # power: Prepare for power profile support
260241 # power: msm8998: Support power profiles
260242 # power: sdm660: Support power profiles
260243 # power: msm8996: Support power profiles
260244 # power: msm8953: Support power profiles
260246 # power: msm8937: Support power profiles
260247 # power: Support power profiles on legacy platforms
)
repopick ${changes[@]}&

wait

# build/make
repopick -f 259858 # Sorry bro: 6 -> 3
