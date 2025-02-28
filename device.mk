#
# Copyright 2018 Joonas Kylmälä
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

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# VNDK
PRODUCT_PACKAGES += \
    vndk_package

# Graphics
PRODUCT_PACKAGES += \
    gralloc.gbm \
    hwcomposer.drm \
    libGLES_mesa \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.composer@2.1-service \

# Audio
PRODUCT_PACKAGES += audio.primary.i9305
PRODUCT_PACKAGES += audio.primary.i9305_legacy
PRODUCT_PACKAGES += android.hardware.audio@2.0-service
PRODUCT_PACKAGES += android.hardware.audio@4.0-impl
PRODUCT_PACKAGES += android.hardware.audio@4.0-service
PRODUCT_PACKAGES += android.hardware.audio.effect@4.0-impl
PRODUCT_PACKAGES += android.hardware.audio.effect@4.0-service

# A2DP
PRODUCT_PACKAGES += \
  audio.a2dp.default \
  android.hardware.bluetooth.a2dp@1.0-impl \
  android.hardware.bluetooth.a2dp@1.0-service \

# Sound trigger
PRODUCT_PACKAGES += \
    sound_trigger.stub.default \
    android.hardware.soundtrigger@2.1-impl \
    android.hardware.soundtrigger@2.1-service \

PRODUCT_COPY_FILES += \
    frameworks/av/media/libeffects/data/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    device/samsung/i9305/audio_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy.conf \
    frameworks/av/services/audiopolicy/config/audio_policy_configuration_generic.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/primary_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/primary_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml

# DRM HAL packages
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-service \
    android.hardware.drm@1.0-impl \

# Keymaster HAL packages
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service \

# Graphics HAL packages
PRODUCT_PACKAGES += \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.renderscript@1.0-impl \

# Light HAL packages
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-impl \
    android.hardware.light@2.0-service \

# Vibrator HAL packages
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl \

# Power HAL packages
PRODUCT_PACKAGES += \
    android.hardware.power@1.0-impl \

# Memory HAL packages
PRODUCT_PACKAGES += \
    android.hardware.memtrack@1.0-impl \
    android.hidl.memory@1.0-impl \

# Sensors HAL packages
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl \

# VR HAL packages
PRODUCT_PACKAGES += \
    android.hardware.vr@1.0-impl \

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.gatekeeper@1.0-service \

# DRM – check if this needs to be removed!
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.0-service \

PRODUCT_COPY_FILES += \
    device/samsung/i9305/fstab.smdk4x12:root/fstab.smdk4x12 \
    device/samsung/i9305/init.smdk4x12.rc:root/init.smdk4x12.rc \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.app_widgets.xml:system/etc/permissions/android.software.app_widgets.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_tv.xml:system/etc/media_codecs_google_tv.xml \

# Get root on the serial console for -eng builds
# This can help debugging early boot issues
ifeq ($(TARGET_BUILD_VARIANT),eng)
PRODUCT_COPY_FILES += device/samsung/i9305/console.rc:system/etc/init/console.rc
endif

# ADB support
PRODUCT_PROPERTY_OVERRIDES += \
    persist.service.adb.enable=1 \
    persist.sys.usb.config=adb

# Hack to get a working GateKeeper
PRODUCT_PACKAGES += gatekeeper.default

# Enable flashing through heimdall
PRODUCT_COPY_FILES += device/samsung/i9305/resize2fs_partitions.sh:system/bin/resize2fs_partitions.sh

# HACK: prevent the device to go in suspend because it's annoying during early
# development. Remove afterward as it consume way more energy this way.
PRODUCT_COPY_FILES += device/samsung/i9305/prevent_suspend.sh:system/bin/prevent_suspend.sh
PRODUCT_COPY_FILES += device/samsung/i9305/prevent_suspend.rc:system/etc/init/prevent_suspend.rc

