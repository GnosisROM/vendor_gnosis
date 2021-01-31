# Copyright (C) 2020 The Gnosis Project
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

#APP
PRODUCT_COPY_FILES += \
	vendor/gnosis/prebuilt/app/ModuleMetadataGoogle/ModuleMetadataGoogle.apk:product/app/ModuleMetadataGoogle/ModuleMetadataGoogle.apk \
	vendor/gnosis/prebuilt/app/ModuleMetadataGoogle/oat/arm64/ModuleMetadataGoogle.odex:product/app/ModuleMetadataGoogle/oat/arm64/ModuleMetadataGoogle.odex \
	vendor/gnosis/prebuilt/app/ModuleMetadataGoogle/oat/arm64/ModuleMetadataGoogle.odex:product/app/ModuleMetadataGoogle/oat/arm64/ModuleMetadataGoogle.odex

#BIN
PRODUCT_COPY_FILES += \
	vendor/gnosis/prebuilt/bin/adb:product/bin/adb \
	vendor/gnosis/prebuilt/bin/adb.bin:product/bin/adb.bin \
	vendor/gnosis/prebuilt/bin/busybox:product/bin/busybox \
	vendor/gnosis/prebuilt/bin/fastboot:product/bin/fastboot

#LIB64
PRODUCT_COPY_FILES += \

#PRIV-APP
PRODUCT_COPY_FILES += \

#OVERLAY
PRODUCT_COPY_FILES += \

