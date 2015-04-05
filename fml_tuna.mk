# boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Inherit FML configuration
$(call inherit-product, vendor/fml/config/common.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/tuna/aosp_tuna.mk)

# Device identifier.
PRODUCT_NAME := fml_tuna
PRODUCT_DEVICE := tuna
PRODUCT_BRAND := Google
PRODUCT_MODEL := Galaxy Nexus
PRODUCT_MANUFACTURER := Samsung
PRODUCT_RESTRICT_VENDOR_FILES := false
