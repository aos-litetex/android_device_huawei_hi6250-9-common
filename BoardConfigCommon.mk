#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

## Common Path
COMMON_PATH := device/huawei/hi6250-9-common

# error: overriding commands for target 
# Fix charger animation conflit
BUILD_BROKEN_DUP_RULES := true

# Build System
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_PREBUILT_ELF_FILES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := hi6250

# Charger
BACKLIGHT_PATH := /sys/class/leds/lcd_backlight0/brightness

# Filesystem
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE    := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE      := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE   := ext4
TARGET_COPY_OUT_ODM     := odm
TARGET_COPY_OUT_VENDOR  := vendor
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USES_MKE2FS := true

# Hardware
BOARD_VENDOR := huawei

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := \
    $(COMMON_PATH)/hidl/vintf/device_framework_matrix.xml \
    vendor/lineage/config/device_framework_matrix.xml

DEVICE_MANIFEST_FILE := $(COMMON_PATH)/hidl/vintf/manifest.xml
DEVICE_MATRIX_FILE := $(COMMON_PATH)/hidl/vintf/compatibility_matrix.xml



# Kernel (boot)
BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_BOOTIMG_HAS_RAMDISK := false
BOARD_CUSTOM_BOOTIMG_MK := hardware/huawei/mkbootimg.mk

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 25165824
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_RECVENDORIMAGE_PARTITION_SIZE := 16777216


# Kernel
BOARD_KERNEL_BASE := 0x00478000
BOARD_KERNEL_CMDLINE := loglevel=4 coherent_pool=512K page_tracker=on slub_min_objects=12 unmovable_isolate1=2:192M,3:224M,4:256M printktimer=0xfff0a000,0x534,0x538 androidboot.selinux=permissive
BOARD_KERNEL_IMAGE_NAME := Image.gz
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x0ff88000 --second_offset 0x00e88000 --tags_offset 0x07988000

TARGET_KERNEL_OPTIONAL_LD := true
KERNEL_SUPPORTS_LLVM_TOOLS := true

TARGET_KERNEL_ADDITIONAL_FLAGS := \
    HOSTCFLAGS="-fuse-ld=lld -Wno-unused-command-line-argument"

# clang-r450784d = Kernel Android 13
TARGET_KERNEL_CLANG_VERSION := r416183b1
TARGET_KERNEL_CLANG_PATH := $(shell pwd)/prebuilts/clang/host/linux-x86/clang-$(TARGET_KERNEL_CLANG_VERSION)

# Bluetooth
BOARD_USES_LIBBT_WRAPPER := true

# SurfaceFlinger
TARGET_DISABLE_TRIPLE_BUFFERING := true

# Kernel Source
TARGET_KERNEL_CONFIG := merge_hi6250_defconfig
TARGET_KERNEL_SOURCE := kernel/huawei/hi6250-9

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 4096

# Platform
TARGET_BOARD_PLATFORM := hi6250

# Props
TARGET_VENDOR_PROP += $(COMMON_PATH)/properties/vendor.prop
TARGET_SYSTEM_PROP += $(COMMON_PATH)/properties/system.prop



# Recovery
BOARD_USES_FULL_RECOVERY_IMAGE := true
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/configs/init/fstab.hi6250
TARGET_RECOVERY_DEVICE_MODULES := init_hisi
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"


# RIL
BOARD_PROVIDES_LIBRIL := true
ENABLE_VENDOR_RIL_SERVICE := true

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(COMMON_PATH)

# Root
BOARD_ROOT_EXTRA_FOLDERS += \
    3rdmodem \
    3rdmodemnvm \
    3rdmodemnvmbkp \
    cust \
    modem_log \
    sec_storage \
    splash2 \
    version

# SELinux
include device/hisi/sepolicy/SEPolicy.mk

# Vendor
VENDOR_SECURITY_PATCH := 2022-01-01 # ANE-LGRP2-OVS 9.1.0.401

## Wi-Fi
ifneq ($(BOARD_HAVE_WIFI),false)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_DRIVER := NL80211

BOARD_WLAN_DEVICE := bcmdhd
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd

WPA_SUPPLICANT_VERSION := VER_0_8_X

WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
endif


# Inherit the proprietary files
include vendor/huawei/hi6250-9-common/BoardConfigVendor.mk

