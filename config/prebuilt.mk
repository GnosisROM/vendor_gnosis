#COMMON
#APP
PRODUCT_COPY_FILES += \

#LIB64
PRODUCT_COPY_FILES += \

#PRIV-APP
PRODUCT_COPY_FILES += \

# Recorder
PRODUCT_PACKAGES += \
    Recorder \
    Terminal

# Busybox
PRODUCT_COPY_FILES += \
	vendor/gnosis/prebuilt/common/xbin/busybox:system/xbin/busybox

# Changelog
PRODUCT_COPY_FILES += \
	vendor/gnosis/prebuilt/common/etc/Changelog.txt:system/etc/Changelog.txt
