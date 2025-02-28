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

$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)
$(call inherit-product, device/samsung/i9305/device.mk)
$(call inherit-product, vendor/lineage/config/common_full.mk)

PRODUCT_NAME := lineage_i9305
PRODUCT_DEVICE := i9305
PRODUCT_BRAND := Putti
PRODUCT_MODEL := Lineage on i9305
PRODUCT_MANUFACTURER := Putti

# Disable A/B update
AB_OTA_UPDATER := false
