#DEVICE
#Nexus 5
ifneq (,$(filter hammerhead aosp_hammerhead, $(TARGET_PRODUCT)))
DEVICE = hammerhead
endif
#Nexus 5x
ifneq (,$(filter bullhead aosp_bullhead, $(TARGET_PRODUCT)))
DEVICE = bullhead
endif
#Pixel 4a (5G)
ifneq (,$(filter bramble aosp_bramble, $(TARGET_PRODUCT)))
DEVICE = bramble
endif
#Pixel 3a
ifneq (,$(filter sargo aosp_sargo, $(TARGET_PRODUCT)))
DEVICE = sargo
endif
#LG G PAD X 8.0
ifneq (,$(filter b3 v521 aosp_v521, $(TARGET_PRODUCT)))
DEVICE = v521
endif

#BUILD TYPE
ifndef ROM_BUILD_TYPE
    ROM_BUILD_TYPE := GNOSIS
endif

# Set all versions
DATE := $(shell date -u +%Y%m%d)
TIME := $(shell date -u +%H%M)

ifneq (,$(filter GNOSIS, $(ROM_BUILD_TYPE)))
PRODUCT_VERSION = 11.0.0_r16
ROM_BASE_VERSION = v11.0.0_r16
ROM_BASE = 11.0.0
ROM_BUILD = gnosis
ROM_VERSION = GnosisROM-$(ROM_BASE_VERSION)
BUILD_VERSION = android-11.0.0_r16
endif

export BUILD_ID=RD1B.201105.010

PLATFORM_SECURITY_PATCH := 2020-11-05

# Allow tethering without provisioning app
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    net.tethering.noprovisioning=true

# Enable ADB authentication <SECURITY>
PRODUCT_PROPERTY_OVERRIDES += \
    ro.adb.secure=1

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.selinux=1

MOD_VERSION := GnosisROM-$(ROM_BASE_VERSION)-$(DATE)-$(DEVICE)
TARGET_BACON_NAME := GnosisROM-$(ROM_BASE_VERSION)
ROM_FINGERPRINT := GnosisROM/$(DEVICE)/$(DEVICE):$(ROM_BASE)/$(BUILD_ID)/$(ROM_BUILD)

PRODUCT_PROPERTY_OVERRIDES += \
    -------ROM-------- \
    ro.mod.version=$(MOD_VERSION) \
    ro.rom.version=android-9.0.0_r50 \
    ro.mod.fingerprint=$(ROM_FINGERPRINT) \
    ro.rom.type=$(ROM_VERSION) \
    ----PROPERTIES---- \

