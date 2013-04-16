# Copyright (C) 2011 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for edison hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps). Except for a few implementation
# details, it only fundamentally contains two inherit-product
# lines, full and edison, hence its name.
#

# Camera and Gallery
PRODUCT_PACKAGES := \
    Gallery

#if we do this after the full_base_telephony is included some of these don't get picked up..
ifeq ($(TARGET_PRODUCT),full_edison)
PRODUCT_COPY_FILES += \
    device/motorola/edison/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml
endif

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=umts_edison

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
# Inherit from edison device
$(call inherit-product-if-exists, device/motorola/kexec/kexec.mk)
$(call inherit-product, device/motorola/edison/device.mk)

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := full_edison
PRODUCT_DEVICE := edison
PRODUCT_BRAND := ATT
PRODUCT_MANUFACTURER := MOTO
PRODUCT_MODEL := ATRIX 2