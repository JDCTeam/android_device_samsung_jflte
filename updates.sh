#!/bin/bash

set -e
source "build/envsetup.sh";

### Platform

## bootable/recovery
changes=(
255831 # recovery: Get a proper shell environment in recovery
259434 # recovery: Puke out an /etc/fstab so stuff like busybox/toybox is happy
255979 # recovery: symlink /sbin for script compatibility
258978 # applypatch: Use static libs for libbrotli and libbz.
259720 # recovery: sdcard is data/media/0
)
repopick ${changes[@]}&

## build/make
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
)
repopick -P build/make ${changes[@]}&

## build/soong
changes=(
256886 # soong: Add function to return camera parameters library name
)
repopick -P build/soong ${changes[@]}&

# external/tinycompress
#changes=(
#256308 # tinycompress: Enable extended compress format
#)
#repopick -P external/tinycompress ${changes[@]}&

## frameworks/av
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

## frameworks/native
changes=(
259448 # libui: Allow invalid bits from callers conditionally
)
repopick -P frameworks/native ${changes[@]}&

## hardware/lineage/interfaces
changes=(
260411 # cryptfshw: Introduce QSEECom backend implementation
263896 # cryptfshw: Introduce kernel backend implementation
)
repopick -P hardware/lineage/interfaces ${changes[@]}&

## hardware/qcom/data/ipacfg-mgr
changes=(
261831 # Kernel Header Changes
261832 # ipacfg-mgr: Use generated kernel headers
)
repopick -P hardware/qcom/data/ipacfg-mgr ${changes[@]}&

## lineage-sdk
changes=(
259996 # lineage-sdk: Update path to ChargingStarted.ogg
)
repopick -P lineage-sdk ${changes[@]}&

## packages/apps/ExactCalculator
changes=(
263677 # ExactCalculator: prevent back gesture conflict
)
repopick -P packages/apps/ExactCalculator ${changes[@]}&

## packages/apps/LineageParts
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

## packages/apps/SetupWizard
changes=(
257065 # Account for PhoneMonitor API change
)
repopick -P packages/apps/SetupWizard ${changes[@]}&

## packages/apps/Trebuchet
changes=(
263006 # Update default workspace
262575 # Apply icon size modifications from old Trebuchet
262576 # Add a 5x4 workspace and switch to it
)
repopick -P packages/apps/Trebuchet ${changes[@]}&

## packages/services/Telephony
changes=(
256792 # Telephony: Add ERI configuration for U.S. Cellular
256793 # Telephony: Support muting by RIL command
256795 # Don't start SIP service before decrypted
)
repopick -P packages/services/Telephony ${changes[@]}&

## system/core
changes=(
264691 # adbd: Initialize adbroot status to false
264692 # adbd: Make adbroot interface a static lib
264693 # adb_root: Enforce caller UID
264694 # adb_root: Add mutex to binder interface
264695 # adb_root: Restart adbd when turning off root
)
repopick -P system/core ${changes[@]}&

## system/vold
changes=(
258176 # vold: skip first disk change when converting MBR to GPT
258177 # vold: Allow reset after shutdown
258178 # vold: Accept Linux GPT partitions on external SD cards
)
repopick -P system/vold ${changes[@]}&
 
wait

# build/make
repopick -P build/make -f 259858 # Sorry bro: 6 -> 3
