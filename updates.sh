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


# frameworks/av
changes=(
256899 # camera: Allow devices to load custom CameraParameter code
)
repopick -P frameworks/av ${changes[@]}&

## frameworks/base
changes=(
256447 # SystemUI: Add Profiles tile
258303 # power: Re-introduce custom charging sounds
258820 # SystemUI: Add visualizer feature
258826 # SystemUI: Dismiss keyguard on boot if disabled by current profile
258827 # SystemUI: Don't dismiss keyguard if user key isn't unlocked
259458 # storage: Do not notify for volumes on non-removable disks
261314 # Allow override of DUN settings
263007 # SystemUI: get rid of build text in qs
256016 # Revert "Disable custom clock faces in SystemUI"
256015 # Revert "Disable ClockOptionsProvider so clocks don't appear in picker app"
263116 # SystemUI: Revive navbar layout tuning via sysui_nav_bar tunable
264427 # Prevent NFE in SystemUI when parsing invalid int
255650 # Revert "Drop final remnants of Type clock face"
255647 # Revert "Drop Type clock face."
255651 # TypeClockController: Make it compile with new plugin API
264687 # ADBRootService: Deal with binder death
264688 # ADBRootService: Remove redundant permission check
)
repopick -P frameworks/base ${changes[@]}&

# frameworks/native
changes=(
259448 # libui: Allow invalid bits from callers conditionally
)
repopick -P frameworks/native ${changes[@]}&

# hardware/lineage/interfaces
changes=(
260411 # cryptfshw: Introduce QSEECom backend implementation
263896 # cryptfshw: Introduce kernel backend implementation
)
repopick -P hardware/lineage/interfaces ${changes[@]}&

# hardware/qcom/data/ipacfg-mgr
changes=(
261831 # Kernel Header Changes
261832 # ipacfg-mgr: Use generated kernel headers
)
repopick -P hardware/qcom/data/ipacfg-mgr ${changes[@]}&

# packages/apps/LineageParts
changes=(
258825 # LineageParts: Reenable system profiles
260416 # Parts: Convert charging sound path to uri
)
repopick -P packages/apps/LineageParts ${changes[@]}&

## packages/apps/Settings
changes=(
258304 # Settings: Add LineageParts charging sound settings preference
258819 # Settings: Add lockscreen visualizer toggle
259315 # One does not simply become a Developer
259459 # storage: Do not allow eject for volumes on non-removable disks
264689 # Settings: Mark adb root toggle as non-persistent
264690 # Settings: Remove ADBROOT permission from manifest
)
repopick -P packages/apps/Settings ${changes[@]}&

# packages/apps/SetupWizard
changes=(
257065 # Account for PhoneMonitor API change
)
repopick -P packages/apps/SetupWizard ${changes[@]}&

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

wait

# build/make
repopick -P build/make -f 259858 # Sorry bro: 6 -> 3
